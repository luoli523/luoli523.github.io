# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 .webp 或 .png（会自动转为 .webp），文件名与文章中引用一致。

## 视觉方案

- Primary skill: `guige-infographic`
- Primary style/layout/aspect: `technical-schematic + clean-explainer / 9:16`
- Why: 这篇文章是 MCP 新规范的技术解读，重点是协议形态、部署拓扑、MRTR 流程、缓存与迁移清单，需要清晰的信息图和工程示意图，而不是情绪化封面。
- Per-image overrides: `stateless-before-after.webp`、`mrtr-flow.webp` 适合更强 technical-schematic；`cacheable-lists.webp` 适合 clean-explainer；`cover.webp` 适合 social-tech poster。

---

## 1. cover.webp — 文章封面

Skill/style: `guige-infographic / social-tech poster + technical-schematic / 9:16`
Role: cover
Intent: 从公司落地旧 MCP 的一连串尴尬现场切入，表达 MCP 2026-07-28 终于升级为生产级基础设施协议。

生成一张 9:16 竖版中文技术封面海报。主题是 “MCP 2026-07-28”。画面下半部是公司落地旧 MCP 的混乱现场：迷路的 session、看不懂 JSON body 的 API Gateway、反复出现的 `tools/list`、被 timeout 剪断的长连接；上半部是新 MCP 形成清晰稳定的基础设施层，连接 load balancer、cache、auth、observability 和多个无状态 Server。标题必须清晰：**MCP 2026-07-28**。副标题：**Agent 协议终于开始像基础设施了**。风格为 clean technical infographic，带一点工程幽默但不要卡通化，深色背景可用但不要赛博朋克，使用青绿色、白色、少量琥珀色强调，中文字体清晰，不要复杂小字。

---

## 2. stateless-before-after.webp — 有状态到无状态部署变化

Skill/style: `guige-infographic / technical-schematic comparison-board / 9:16`
Role: comparison
Intent: 用“单实例正常、扩成两个实例 session 就迷路”的公司部署现场，对比新 MCP 的无状态体验。

生成一张 9:16 竖版技术对比图，左右两栏。左栏标题：**旧模式：扩容后 session 迷路**，画面显示 Client 先 initialize，拿到 Mcp-Session-Id，第一次请求到 Server A，第二次被 Load Balancer 分到一脸问号的 Server B，旁边有 Sticky Session、Shared Session Store、Long-lived Stream 标签。右栏标题：**新模式：任意实例都能处理**，画面显示每个请求携带 MCP-Protocol-Version、Client Info、Capabilities，Load Balancer round-robin 分发到 Server A/B/C。中间用箭头标注：**从特殊照顾 → 普通 HTTP 工作负载**。要求中文标签清晰，架构图风格，线条干净，幽默只通过 Server B 的问号表达，不要卡通人物。

---

## 3. mrtr-flow.webp — MRTR 多轮请求响应流程

Skill/style: `guige-infographic / technical-schematic flowchart / 9:16`
Role: flowchart
Intent: 解释公司高风险操作的用户确认，如何从容易被网关超时剪断的长连接，变成可恢复的无状态多轮请求。

生成一张 9:16 竖版流程图，展示 Multi Round-Trip Requests。顶部先用一个小型旧模式反例：用户确认稍慢，长连接被企业网关标记 `timeout` 并剪断。主体流程节点依次为：1）Client 调用高风险 tool；2）Server 返回 `resultType: input_required`；3）Client 向用户收集确认/参数；4）Client 带 `inputResponses` 重试原调用；5）任意 Server 实例继续处理并返回最终结果。示例气泡：“删除 3 条记录，确认吗？”。底部总结文字：**确认是业务流程，不是连接保活挑战。** 技术图风格，箭头清晰，中文为主，关键字段用 JetBrains Mono 风格。

---

## 4. cacheable-lists.webp — 工具列表缓存与上下文稳定

Skill/style: `guige-infographic / clean-explainer / 9:16`
Role: section explainer
Intent: 用公司 Agent 反复拉取同一份工具列表的浪费场景，解释 ttlMs/cacheScope 带来的成本和稳定性变化。

生成一张 9:16 竖版解释图。画面上半部分显示公司 Agent 连续三次请求完全相同的 `tools/list`，服务端三次返回同一份工具目录，旁边的 token 计数器持续上涨，标签为“工具没变，账单在变”“上下文抖动”“prompt cache 失效”；下半部分显示新规范下 list response 带 `ttlMs` 和 `cacheScope`，客户端缓存稳定 tool catalog，后续请求直接命中缓存。标题：**工具一个没变，Agent 为什么还要问十遍？** 标签包含：`tools/list`、`resources/list`、`ttlMs`、`cacheScope`、Prompt Cache Stable。风格清爽，信息层级明确，带轻微工程幽默。

---

## 5. migration-checklist.webp — MCP 2026-07-28 迁移检查清单

Skill/style: `guige-infographic / dense-modules + clean-explainer / 9:16`
Role: checklist
Intent: 把开发、平台、安全三个团队共同需要检查的迁移要点做成可收藏清单。

生成一张 9:16 竖版中文检查清单海报，标题：**MCP 2026-07-28 公司迁移检查清单**。按三个责任区组织：开发团队（协议版本、显式状态句柄、MRTR、Tasks extension），平台团队（移除 Session 依赖、Header 路由、List 缓存、W3C Trace Context），安全团队（Auth 硬化、issuer 校验、Deprecated 功能排查）。底部一句：**目标：stateless / routable / cacheable / governable**。风格为 dense modules clean technical infographic，文字必须清晰，模块不要太小，适合手机阅读。

---

## 使用说明

1. 将上述 prompt 分别输入 AI 图片生成工具（如 Midjourney, DALL-E, Ideogram 等）
2. 默认使用 9:16 竖图；如果 prompt 中指定 16:9、1:1 或 SVG，则按 prompt 的画幅执行
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）
4. 文章中已经用 `![描述](文件名.webp)` 格式引用了这些图片
