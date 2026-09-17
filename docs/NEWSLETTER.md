# 邮件订阅运维手册

主站、[guige-ai-site](https://github.com/luoli523/guige-ai-site)、[poem_gen_pub](https://github.com/luoli523/poem_gen_pub) 三个站的邮件订阅共用一套后端。
这份文档记录它由哪几块组成、密钥在哪、怎么排查、怎么加新站，以及上线时踩过的坑。2026-09-17 上线。

评论后端见 [WALINE.md](WALINE.md)。

---

## 架构

```
读者在站上填邮箱（纯 HTML 表单，隐藏字段 list=ai|blog|poem）
        │ POST
        ▼
subscribe.guige.ai/subscribe  ── Resend ──►  确认邮件（48 小时有效的签名链接）
        ▲                                          │ 读者点确认
        │                                          ▼
   Vercel 项目 guige-subscribe          subscribe.guige.ai/confirm → 邮箱进入 Resend 对应名单
                                                   │
 站点部署成功 ──► GitHub Actions notify job ──► scripts/notify_subscribers.py ──► Resend Broadcasts
                                                   │
                                          名单里的人收到「摘要 + 链接」邮件（底部自带退订链接）
```

**每个站只订自己的名单，不做多选。** 分群靠三个独立的 Resend audience，不靠标签。

| 组件 | 在哪 | 干什么 |
|---|---|---|
| 域名 `guige.ai` | Cloudflare Registrar，到期 2028-09-17，DNS 在 Cloudflare | 发件域 + `subscribe.guige.ai` |
| Resend | <https://resend.com>，账号 luoli523@gmail.com，区域 Tokyo | 名单（audience）、发确认信、群发、送达/打开/点击统计 |
| `guige-subscribe` | 仓库 [luoli523/guige-subscribe](https://github.com/luoli523/guige-subscribe)（私有）→ Vercel 项目同名 → `subscribe.guige.ai` | 双重确认的两个接口，约 150 行 Node，无依赖；三个名单各有一套确认邮件文案，在 `lib/common.js` 的 `LISTS` 里改 |
| `notify_subscribers.py` | [guige-ai-site/scripts/notify_subscribers.py](https://github.com/luoli523/guige-ai-site/blob/main/scripts/notify_subscribers.py)，主站与诗词站 workflow 直接拉 raw | 把新文章组成邮件，调 Resend Broadcasts 发给指定名单 |
| notify job | 三个仓库各自的 deploy workflow 末尾 | 部署成功后找新内容、调脚本 |

### 三个名单

| 名单 | Resend audience id | 站点 | notify 触发 |
|---|---|---|---|
| 鬼哥AI行业动态&学习指引 | `78a9e1a3-2334-4cb2-a2b0-fefe971c28f5` | guige-ai-site | push 新增 `content/daily/YYYY-MM-DD.md`（bot 有内容才发，不固定每日） |
| 鬼哥的笔记随想 | `beb5412b-f8dc-4377-815b-b82313550d30` | luoli523.github.io | push 新增 `content/post/*/index.md` |
| 鬼话诗 | `32bad0bc-684d-4ade-8128-37d3000b9b2f` | poem_gen_pub | 部署后找目录名以今天（北京日期）开头的 `site/content/poems/*` |

诗词站的部署由 `workflow_run` 触发，拿不到 push 的 diff，所以按日期找；脚本按 name 幂等，重复部署不会重发。

发件人 `鬼哥 <hi@guige.ai>`，回信 `luoli523@gmail.com`，写在脚本和 Vercel 环境变量里。

---

## 密钥与配置在哪

| 什么 | 位置 | 备注 |
|---|---|---|
| Resend API key（Full access） | 本机 `~/.config/resend/api_key`；GitHub Secrets `RESEND_API_KEY`（三个仓库）；Vercel 项目 env `RESEND_API_KEY` | 只发信权限的 key 读不了名单，建 key 时选 Full access |
| Cloudflare DNS token（只限 guige.ai zone） | 本机 `~/.config/cloudflare/guige-ai-dns-token` | zone id `c7cecd68716f1033d516efe54126d2c8` |
| 确认链接签名密钥 `SIGNING_SECRET` | 只在 Vercel env | 换掉会让所有未点击的确认链接失效，不影响已订阅者 |
| Vercel 其余 env | `AUDIENCE_AI / AUDIENCE_BLOG / AUDIENCE_POEM / FROM / REPLY_TO / BASE_URL` | `vercel env ls production` 查看 |

Vercel CLI 本机需 `npx -y vercel@latest login`；`vercel env add NAME production` 一次只能一个环境。

### DNS 记录（guige.ai，全部 DNS-only，不走橙色云）

| 类型 | 名 | 值 | 作用 |
|---|---|---|---|
| TXT | `resend._domainkey` | `p=MIGf…` | DKIM 公钥 |
| CNAME | `send` | `send.forge.rmta.net` | SPF / 退信域 |
| CNAME | `rsend` | `rsend-apne1.forge.rmta.net` | SPF / 退信域 |
| TXT | `_dmarc` | `v=DMARC1; p=none; rua=mailto:luoli523@gmail.com` | DMARC 监控模式；发信稳定后可改 `p=quarantine` |
| CNAME | `subscribe` | `cname.vercel-dns.com` | 订阅接口 |

---

## 日常排查

### 读者说「订阅没反应」

```bash
K=$(cat ~/.config/resend/api_key)

# 1. 接口活着吗（GET /subscribe 应 405，坏 token 应 400 + 中文错误页）
curl -s -o /dev/null -w "%{http_code}\n" https://subscribe.guige.ai/subscribe
curl -s "https://subscribe.guige.ai/confirm?t=bad" | grep -o '<h1>[^<]*</h1>'

# 2. 确认邮件发出去了吗（最近发信记录，含 last_event：delivered / bounced …）
curl -s -H "Authorization: Bearer $K" "https://api.resend.com/emails?limit=10" | python3 -m json.tool | grep -E '"to"|"subject"|"last_event"'

# 3. 邮箱在名单里吗
curl -s -H "Authorization: Bearer $K" https://api.resend.com/audiences/<audience id>/contacts | python3 -m json.tool | grep -E '"email"|"unsubscribed"'

# 4. 函数日志（Vercel）
cd /path/to/guige-subscribe && npx -y vercel@latest logs https://subscribe.guige.ai
```

常见原因：读者没点确认（名单里没有）、确认链接超过 48 小时、邮箱写错、确认信进了垃圾箱。

### 新文章没收到邮件

1. 看对应仓库 Actions 里 `notify` job 的日志。三种正常输出：「本次 push 没有新增…，跳过」「已存在 broadcast「…」，跳过」「已发送：…」。
2. 看 Resend 后台 Broadcasts：status 应为 `sent`，点进去看送达/打开数。
3. 常见原因：
   - bot 是**修改**而不是**新增**文件（`--diff-filter=A` 只认新增）
   - 同一 push 多个 commit，`github.event.before` 在 force-push 后为空 → diff 为空 → 跳过
   - 免费额度用尽（每天 100 封 / 每月 3000 封）→ Resend 返回 429/403，job 标红，站点部署不受影响
   - 诗词站：目录名日期与北京日期不一致（流水线 UTC 23:00 跑，用的是北京日期，正常一致）

### 手动补发一封

```bash
cd guige-ai-site && RESEND_API_KEY=$(cat ~/.config/resend/api_key) python3 scripts/notify_subscribers.py \
  --kind daily --file content/daily/2026-09-18.md \
  --base-url https://luoli523.github.io/guige-ai-site \
  --audience 78a9e1a3-2334-4cb2-a2b0-fefe971c28f5 --dry-run   # 先建草稿看效果，去掉 --dry-run 真发
```

`--kind post` 用 `--base-url https://luoli523.github.io`，`--kind poem` 用 `--base-url https://luoli523.github.io/poem_gen_pub`。
草稿在 Resend 后台 Broadcasts 里能预览、能删（`DELETE /broadcasts/<id>`）。已发过的（name 相同）会被幂等跳过；确要重发，先在后台删掉那条 broadcast。

---

## 加一个新站 / 新名单

1. Resend 建 audience（免费版**只能 3 个**，要么删一个要么升级 $20/月）
2. `guige-subscribe`：`lib/common.js` 的 `LISTS` 加一项，Vercel 加 env `AUDIENCE_<KEY>`，重新部署
3. 新站表单：抄任一站的 `subscribe.html` partial，隐藏字段 `list=<key>`、`source=<站名>`、`back={{ .Permalink }}`、蜜罐 `website`
4. 新站 workflow 加 `notify` job：拉 raw 脚本，`--kind` 选 daily / post / poem 之一（或在脚本里加 builder），`--audience` 填新 id，Secrets 加 `RESEND_API_KEY`
5. 用真实邮箱走一遍：订阅 → 确认 → 名单里出现 → `--dry-run` 建一封草稿看效果

---

## 额度与升级路径

| | 免费 | Pro $20/月 |
|---|---|---|
| 每月 | 3000 封 | 50000 封 |
| 每天 | **100 封** | 不限 |
| 联系人 | 1000 | 更多 |
| audience | 3 | 更多 |

诗词每天一封、AI 动态不定期，粗算：两个名单合计约 100 人时可能触顶。到那时二选一：升 Pro，或把发信通道换成 Amazon SES（脚本只需改 `api()` 那一层，名单可导出迁移）。

---

## 踩过的坑（2026-09-15 → 09-17）

| 坑 | 结论 |
|---|---|
| **Buttondown 人工审核未过** | `github.io` 站 + gmail 发件人的个人中文站，在所有托管 newsletter 平台都会被当高风险。**根因是没有自己的域名**；有了 `guige.ai` 后 Resend 验证域名即放行，无人工审核 |
| Buttondown 免费版按功能加钱 | RSS 转邮件、标签、统计各 +$9/月；不要再考虑 |
| Resend 前面的 Cloudflare 拦 `Python-urllib` UA | 所有 API 调用返回 403 `error code: 1010`；脚本显式设 `User-Agent` |
| Resend broadcast `name` ≤ 70 字符 | 带中文的 URL 做幂等键会超；改用 `kind/slug` 短名，超长截断加哈希 |
| 免费版 audience 上限 3 | 默认的 `General` 得删掉腾位置 |
| 只发信权限的 API key | 读不了域名和名单；建 key 选 Full access |
| `vercel env add` | 一次只能一个环境，`production preview` 连写会失败 |
| GitHub 偶发 `fatal error in commit_refs` | ref 更新成功但 push 事件没发出、Actions 不跑；`gh workflow run deploy.yml` 手动触发 |
| GitHub Pages 用 `workflow_run` 触发的站 | 拿不到 push diff，找新内容要换思路（按日期） |
