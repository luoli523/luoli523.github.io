# 域名与站点挂载（2026-10-07 起）

本文件是 **guige.ai 域名拓扑的唯一事实源**。各站点仓库的 CLAUDE.md 只写一小节约束，细节一律指回这里。

## 域名

| 项 | 值 |
|---|---|
| 域名 | `guige.ai`（唯一域名，没有别的） |
| 注册商 | Cloudflare Registrar，到期 **2028-09-17** |
| zone id | `c7cecd68716f1033d516efe54126d2c8` |
| DNS token | 本机 `~/.config/cloudflare/guige-ai-dns-token` |

## 站点挂载方式：根域 + 子路径

`guige.ai` 只绑定在**用户站点仓库** `luoli523.github.io` 上（`static/CNAME` + Pages 配置的 custom domain）。

GitHub 的行为是：**用户站点配了自定义域之后，同账号下所有没有自己 CNAME 的项目站会自动跟随同一个域**。
所以其余仓库什么都不用配，自动变成 `guige.ai/<仓库名>/`。

> **不要给项目站仓库加 CNAME 文件。** 加了反而会把它从统一域里摘出去。

当前挂载：

| 地址 | 仓库 |
|---|---|
| `guige.ai/` | `luoli523.github.io` |
| `guige.ai/guige-ai-site/` | AI 行业动态日报 |
| `guige.ai/poem_gen_pub/` | 鬼话诗 |
| `guige.ai/fin-report/` | AI 产业链投资简报 |
| `guige.ai/huiwang/` | 《回望灯火阑珊》 |
| `guige.ai/learn-cc/` · `learn-llm/` · `learn-claw/` · `cc-analysis/` | 四本书 / 源码剖析 |
| `guige.ai/guige-guitar-plan/` | 吉他 Solo 训练计划 |

旧地址 `luoli523.github.io/*` 由 GitHub **自动 301** 到对应新地址，已验证全部生效。HTTPS 已强制（`http` 和 `www` 都 301 到 apex）。

## 为什么是子路径，不是各站子域

因为 **Waline 的评论、表情、阅读量是按 URL 路径存的**（模板里 `data-path="{{ .RelPermalink }}"`）。
子路径方案下路径一个字都没变，历史数据全部保留；换成 `ai.guige.ai` 这种子域，路径会从
`/guige-ai-site/daily/x/` 变成 `/daily/x/`，所有历史评论和阅读数会对不上。

**推论：不要改动已发布页面的 URL 路径**，改了等于丢该页的评论和阅读量。

## DNS 记录

全部 **DNS only（灰云）**。开 Cloudflare 橙云代理会让 GitHub Pages 的证书签发失败。

| 记录 | 值 | 用途 |
|---|---|---|
| `@` A ×4 | `185.199.108.153` / `109.153` / `110.153` / `111.153` | GitHub Pages apex |
| `www` CNAME | `luoli523.github.io` | 301 到 apex |
| `subscribe` CNAME | `cname.vercel-dns.com` | 邮件订阅 API（项目 `guige-subscribe`） |
| `go` CNAME | `cname.vercel-dns.com` | 短链跳转（同一个 Vercel 项目） |
| `send` / `rsend` CNAME | `*.forge.rmta.net` | Resend 发信 |
| `resend._domainkey` TXT | — | DKIM |
| `_dmarc` TXT | `p=none` | 发信监控 |

## 各站构建配置

| 仓库 | 配置位置 | 形式 |
|---|---|---|
| `luoli523.github.io` | `config/_default/hugo.toml` | 绝对 `https://guige.ai/`（根 `hugo.toml` 是没用的残留默认文件，别改那个） |
| `guige-ai-site` | `hugo.toml` | 绝对 `https://guige.ai/guige-ai-site/` |
| `poem_gen_pub` | `site/hugo.yaml` + `pages.yml` | 构建走 `steps.pages.outputs.base_url`，自动跟随 |
| `huiwang` | `hugo.toml` | 绝对 `https://guige.ai/huiwang/` |
| `fin-report` | `website/astro.config.mjs` | `base: '/fin-report'` 相对 + `site:` 绝对 |
| `learn-cc` | `.vitepress/config` | `base: '/learn-cc/'` 相对 |
| `guige-guitar-plan` | `vite.config.ts` | `base` 取环境变量 `PAGES_BASE_PATH` |
| `learn-llm` / `learn-claw` / `cc-analysis` | — | 相对路径，无需配置 |

**相对 base 的不要改成绝对 URL**，它们换域天然不受影响。

## 加一个新站

1. 新仓库开 GitHub Pages，**不要加 CNAME 文件**，它会自动出现在 `guige.ai/<仓库名>/`
2. 构建配置的 base 用相对路径 `/<仓库名>/`
3. 在该仓库 CLAUDE.md 加「站点地址」小节，指回本文件
4. 要邮件订阅的话，另见 [NEWSLETTER.md](NEWSLETTER.md)

## 回滚

删掉 Cloudflare 的 4 条 apex A 记录 + 清空 `luoli523.github.io` 的 Pages custom domain，即可退回 `luoli523.github.io`。两分钟。

## 注意事项

- 新内容里不要再写 `luoli523.github.io` 地址，一律用 `guige.ai`
- `guige-subscribe` 的返回链接白名单在 `lib/common.js`，同时认 apex `guige.ai`、`*.guige.ai` 和旧域 `luoli523.github.io`；加新域名要同步改那条正则和它的测试
- 历史内容（各站 `content/` 下的旧文章、已发布的微信稿存档、`static/daily/*-sources-full.md`）里的旧域链接**没有改**，靠 301 兜底，不要为此发起批量重写
