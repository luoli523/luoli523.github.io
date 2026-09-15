# Waline 评论后端运维手册

主站（luoli523.github.io）与 [guige-ai-site](https://github.com/luoli523/guige-ai-site) 共用同一个 Waline 后端，
评论、表情反应、浏览量都走它。这份文档记录它部署在哪、怎么排查、怎么安全升级，以及踩过的坑。

---

## 架构

| 项 | 值 |
|---|---|
| 服务地址 | `https://waline-server-amber.vercel.app` |
| 管理后台 | `https://waline-server-amber.vercel.app/ui` |
| 代码仓库 | [luoli523/waline-server](https://github.com/luoli523/waline-server)（三个文件：`api/index.js`、`package.json`、`vercel.json`） |
| Vercel 项目 | team `luoli523s-projects` → project `waline-server`；push 到 `main` 自动构建 |
| 服务端包 | `@waline/vercel`，版本**固定**在 `package.json`（当前 `1.39.3`） |
| 数据库 | PostgreSQL，环境变量 `PG_HOST / PG_PORT / PG_DB / PG_USER / PG_PASSWORD / PG_SSL`（值只在 Vercel 后台） |
| 通知 | Telegram，`TG_BOT_TOKEN / TG_CHAT_ID` |

两个站按 **URL 路径** 区分数据：主站是 `/p/<slug>/`，动态站是 `/guige-ai-site/daily/<date>/`。
主站客户端配置在 `config/_default/params.toml` 的 `[comments.waline]`；动态站在 `layouts/daily/single.html`。

---

## 日常排查：先打接口，再看日志

不用开浏览器，几条 curl 能定位九成问题。`S` 是服务地址，`P` 换成出问题的页面路径。

```bash
S=https://waline-server-amber.vercel.app
P=/guige-ai-site/daily/2026-09-12/

# 服务端版本（函数起不来时这一行是空的）
curl -sI "$S/" | grep -i x-waline-version

# 评论列表
curl -s "$S/api/comment?path=$P&pageSize=5&page=1&lang=zh-CN&sortBy=insertedAt_desc"

# 表情：读
curl -s "$S/api/article?path=$P&type=reaction0,reaction1,reaction2,reaction3,reaction4,reaction5&lang=zh-CN"
# 表情：加一 / 减一（测完记得减回去，否则页面上会多一个假表情）
curl -s -X POST "$S/api/article?lang=zh-CN" -H "Content-Type: application/json" \
  -d "{\"path\":\"$P\",\"type\":\"reaction0\",\"action\":\"inc\"}"
curl -s -X POST "$S/api/article?lang=zh-CN" -H "Content-Type: application/json" \
  -d "{\"path\":\"$P\",\"type\":\"reaction0\",\"action\":\"desc\"}"

# 浏览量（首页批量读也是这个接口，path 用逗号分隔）
curl -s "$S/api/article?path=$P&type=time&lang=zh-CN"

# 跨域预检（前端提交评论前浏览器会先发这个，期望 204）
curl -s -o /dev/null -w "%{http_code}\n" -X OPTIONS "$S/api/comment" \
  -H "Origin: https://luoli523.github.io" -H "Access-Control-Request-Method: POST"
```

正常返回都是 `{"errno":0,...}`。三种异常形态：

| 现象 | 大概率原因 | 去哪看 |
|---|---|---|
| 返回 HTML `FUNCTION_INVOCATION_FAILED`，版本头为空 | 函数启动就崩，多半是升级后依赖不兼容 | `vercel logs`，见下 |
| `{"errno":500,"errmsg":"update data is empty, ..."}` | 数据库表缺列（见「数据库表结构」） | 对照官方 schema |
| 第一次 POST 成功、第二次 500、GET 永远 0 | 同上，`add` 静默丢字段、`update` 报错 | 同上 |

函数日志（需要先 `npx -y vercel@latest login`，浏览器授权一次）：

```bash
git clone https://github.com/luoli523/waline-server /tmp/waline-server && cd /tmp/waline-server
npx -y vercel@latest link --yes --project waline-server
npx -y vercel@latest logs https://waline-server-amber.vercel.app --json | head -50
```

---

## 版本升级流程

`package.json` 里**不要写 `latest`**。2026-09-15 之前就是 `latest`，一次无缓存重部署直接把线上打挂（见事故复盘）。

### 0. 升级前先查目标版本能不能跑

Waline ≥ 1.41.2 依赖 `jsdom` 29，后者链到纯 ESM 的 `@exodus/bytes`，Vercel 的 Node 运行时加载器 `require()` 不了，函数启动即崩。
升级前用 npm 查一眼目标版本的依赖：

```bash
npm view @waline/vercel@<版本> dependencies.jsdom
# ^19.x → 可以；^29.x（或更高）→ 在 Vercel 上会崩，除非上游已修
```

已验证的版本：`1.39.3`（线上）、`1.40.x`、`1.41.0`、`1.41.1` 用的都是 jsdom 19；`1.41.2`–`1.41.6` 用 jsdom 29，**不能上**。
更高版本需重新查；上游若换回兼容依赖或 Vercel 运行时支持 `require(esm)`，此限制才解除。

### 1. 改版本号并 push

```bash
cd waline-server
# 把 "@waline/vercel": "1.39.3" 改成目标版本
git commit -am "bump @waline/vercel to <版本>" && git push
```

Vercel 会自动构建一个新的 Production 部署。构建成功只说明 `npm install` 没报错，**不代表函数能跑**。

### 2. 确认生产域名指向了哪个部署

```bash
npx -y vercel@latest ls waline-server            # 看最新部署的 URL 和状态
npx -y vercel@latest inspect https://waline-server-amber.vercel.app | grep url
```

**坑：** 只要项目做过一次 Instant Rollback，之后的新部署就**不会自动接管生产域名**，`ls` 里显示 Ready 但 `inspect` 指向的还是老的。需要手动：

```bash
npx -y vercel@latest promote https://waline-server-<hash>-luoli523s-projects.vercel.app --yes
```

新部署自己的 URL 有 Vercel 部署保护，curl 会被 302 到登录页，**没法在 promote 之前预验证**。所以 promote 后必须马上做第 3 步。

### 3. 验证

跑「日常排查」里那组 curl，重点看：版本头变成目标版本；评论 GET 200；表情 inc → inc → desc → desc 返回 1 → 2 → 1 → 0；浏览量 GET 正常。
再看 `vercel logs` 最近几分钟没有 5xx。

### 4. 崩了就回滚

```bash
npx -y vercel@latest rollback https://waline-server-<上一个正常的 hash>-luoli523s-projects.vercel.app --yes
```

几秒生效。回滚后记得把 `package.json` 改回去再 push，否则下次任何重建又会装到坏版本。

---

## 数据库表结构

Waline 不会自动迁移表结构。表是建站时手动按官方 SQL 建的，**新版本用到新列时不会自己加**。
官方 schema：<https://github.com/walinejs/waline/blob/main/assets/waline.pgsql>（PostgreSQL 表名全小写）。

对照方法（只读，用 Node 的 `pg` 包，不用装 psql）：

```bash
cd /tmp/waline-server
npx -y vercel@latest env pull --environment=production .env.prod --yes   # 拉凭据到本地，用完删
mkdir -p /tmp/pgcli && cd /tmp/pgcli && npm i pg
```

```js
// query.mjs：读取 .env.prod 里 PG_*，打印某张表的列
import { readFileSync } from 'node:fs'; import pg from 'pg';
const env = Object.fromEntries(readFileSync('/tmp/waline-server/.env.prod','utf8').split('\n')
  .filter(l => l.startsWith('PG_')).map(l => { const i = l.indexOf('='); return [l.slice(0,i), l.slice(i+1).replace(/^"|"$/g,'')]; }));
const c = new pg.Client({ host: env.PG_HOST, port: +env.PG_PORT, database: env.PG_DB, user: env.PG_USER,
  password: env.PG_PASSWORD, ssl: env.PG_SSL === 'true' ? { rejectUnauthorized: false } : false });
await c.connect();
console.table((await c.query(`SELECT column_name, data_type FROM information_schema.columns
  WHERE table_name = $1 ORDER BY ordinal_position`, [process.argv[2] ?? 'wl_counter'])).rows);
await c.end();
```

```bash
node query.mjs wl_counter && rm /tmp/waline-server/.env.prod
```

### 2026-09-15 补过的列

`wl_counter` 建表时只有 `id / time / url / createdat / updatedat`，缺表情用的 9 列，已执行：

```sql
ALTER TABLE wl_counter
  ADD COLUMN IF NOT EXISTS reaction0 int, ADD COLUMN IF NOT EXISTS reaction1 int,
  ADD COLUMN IF NOT EXISTS reaction2 int, ADD COLUMN IF NOT EXISTS reaction3 int,
  ADD COLUMN IF NOT EXISTS reaction4 int, ADD COLUMN IF NOT EXISTS reaction5 int,
  ADD COLUMN IF NOT EXISTS reaction6 int, ADD COLUMN IF NOT EXISTS reaction7 int,
  ADD COLUMN IF NOT EXISTS reaction8 int;
```

`wl_comment`、`wl_users` 没有对照过；以后升级若某个功能报 `update data is empty`，先对照这两张。

---

## 事故复盘：2026-09-15

**起因**：读者反馈动态站「无法评论 / 发表情」。

| 时间线 | 发生了什么 |
|---|---|
| 排查 | curl 发现评论接口正常；表情第二次 `inc` 必 500 `update data is empty`。定位到 `think-model` 会静默丢掉表里不存在的列，`wl_counter` 缺 `reaction*` |
| 修复 1 | `ALTER TABLE` 补 9 列，验证通过。主站同时受益（同一张表） |
| 升级 | 顺手把线上 1.39.3 升到最新 1.41.6：在 Vercel 后台 Redeploy 且不带构建缓存 |
| **故障** | 所有接口 `FUNCTION_INVOCATION_FAILED`，约 8 分钟。日志：`ERR_REQUIRE_ESM ... @exodus/bytes/encoding-lite.js from html-encoding-sniffer` |
| 回滚 | `vercel rollback` 到 184 天前的部署，几秒恢复 |
| 修复 2 | `package.json` 从 `latest` 固定为 `1.39.3`，push 触发构建 → 新部署 Ready 但生产域名没切（Rollback 后不自动接管）→ 手动 `promote` → 验证通过 |

**教训**：

1. 服务端包版本必须固定；`latest` 等于把每次重建都变成一次盲升级。
2. 升级前查依赖链，Vercel 运行时对纯 ESM 依赖不友好。
3. Rollback 之后的部署要手动 promote，`ls` 显示 Ready 不等于线上已切换。
4. 「评论提交失败」的反馈，先用 curl 分别打评论 / 表情 / 浏览量，别只看评论接口——客户端把任何接口报错都表现成「点了没反应」。
