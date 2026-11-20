# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 .webp 或 .png（会自动转为 .webp），文件名与文章中引用一致。

## 视觉方案

- Primary skill: `guige-svg`
- Primary style/layout/aspect: `architecture / flowchart / comparison，theme guige-light，16:9`
- Why: 文章先讲 Agent 平台的整体运行框架，再讲 Action 生命周期和搭建顺序，核心是“请求怎么走、箭头往哪指、状态怎么转”，需要确定、可编辑、标签清晰的图，SVG 比生成式插画更不容易画错箭头和状态。
- Per-image overrides: `cover.webp` → `guige-hand-write-pic / hand-drawn-edu / 9:16`。封面负责第一眼的隐喻，手绘教学风也和原参考图的手绘风格呼应，但画面完全重新构图，不复刻原图。

> 术语约定：图中所有技术名词保留英文（Orchestrator、Action、Permission Engine、Approval Queue、Tool Registry、MCP Gateway、Code Sandbox、Memory Service、Task Queue、tracing、evals、guardrails、Audit Log 等），说明性短语用中文。
>
> 版权说明：所有配图均为按本文论点重绘的示意图。不要复制 Tech Fusionist 原图的版式、图标或配色，也不要在图中出现原作者署名或水印；出处已在正文链接原帖。

---

## 1. cover.webp — 文章封面

Skill/style: `guige-hand-write-pic / hand-drawn-edu / 9:16`
Role: cover
Intent: 一眼传达“Orchestrator 只能提议，真正的执行要先过一道闸门”——Agent 平台的核心是 Action。

生成一张 9:16 竖版中文手绘教学风封面，米白纸张底，黑色细线条，配青绿色（#2dd4bf）和少量琥珀色（#f59e0b）点缀。画面上半部：一个圆角方框形状的小机器人，胸前名牌写 `Orchestrator`，手里举着一张卡片，卡片上写 `Action`，卡片右上角有一把小锁和一串短哈希符号（表示参数已冻结）。机器人面前是一道带检查口的闸门，闸门顶上的牌子写 `Permission Engine`，闸门侧面挂三个小标签：`policy`、`approval`、`idempotency`。闸门另一侧排着几个 tools 图标（Jira ticket、GitHub 仓库、数据库、邮件），用一根粗箭头连接；箭头必须从机器人出发，**先穿过闸门**，再到达 tools，画面中不能出现绕过闸门的直连线。闸门旁边站着一个小人，手里拿着印章，旁边小字 `Approval Queue`。画面底部一条细长的纸带贯穿左右，写着 `Audit Log`，上面有几个小格子。

标题（必须准确、清晰）：**搭 Agent 平台，先设计 Action**
副标题：**再写 Orchestrator**

要求：中英文字体清晰，标题占画面上方约 1/5；整体留白充足，不要堆砌小字；幽默只通过机器人一本正经举卡片排队的姿态表达，不要卡通夸张表情；不要赛博朋克、不要深色背景、不要任何品牌 logo。

---

## 2. agent-platform-architecture.webp — AI Agent 平台整体架构（手绘全景，文章开头）

Skill/style: `guige-hand-write-pic / hand-drawn-edu / 4:3 横版`（不带鬼哥人物形象）
Role: hero architecture，放在文章第一段之后
Intent: 作为“鬼哥画的整体架构图”，一张图把平台全貌讲清楚，后文“先走一遍”逐个子系统都对照这张图。

绘制一张 4:3 横版中文手绘教学风架构全景图，米白纸张底，黑色细线条，分区用淡色块（青绿 #2dd4bf、琥珀 #f59e0b、淡蓝、淡粉）区分，所有组件名用英文，旁边说明用简短中文或英文小字。标题：**AI Agent 平台整体架构**。布局：

- 左上：小人 `User`（`Chat / Slack / API`）→ `Agent Gateway`。
- 左侧一列：`Identity & Auth`（`SSO / OAuth、user → agent scopes`）、`Agent Registry`（`definitions / system prompts / versioning`）、`Memory Service`（`session memory (Redis)、long-term memory (Vector DB)、user preferences`），都用箭头连向中央。
- 中央最大的框：`Agent Orchestrator`（`Plan → Act → Observe loop、sub-agent delegation、retry & recovery、context window`），右侧双向箭头 `reason / decide` 连 `LLM Router`（`reasoning model、fast model、fallbacks`）。
- Orchestrator 正下方，用醒目的青绿粗箭头向下连 `Permission Engine`（`policy per Action、least privilege、read vs write tiers`）；再向下 `needs approval` 到 `Approval Queue`（琥珀色，`paused / approve / reject / timeout`），并用虚线 `approve?` 连回左上角 User。
- 从 Permission Engine 向右的箭头到右侧执行区：`Tool Registry`（`JSON schemas、discovery、rate limits`）→ `MCP Gateway`（`auth、proxy、sanitize`）→ 三个小框 `GitHub`、`Jira`、`Database`；另一个 `Code Sandbox`（`isolated containers、time & resource limits`）。执行结果用细箭头 `observe` 回到 Orchestrator。
- 底部一排横切层：`Task Queue (Temporal / Kafka)`、`Tracing & Observability (OpenTelemetry / Langfuse)`、`Evals & Guardrails`、`Audit Log`，用虚线向上连。

关键约束：Orchestrator 到 tools **不能**有直连箭头，必须经过 Permission Engine；这根往下的箭头要画得最醒目（文章核心论点）。重新构图，不复刻 Tech Fusionist 原图的版式、图标与配色，不加任何署名或水印。文字清晰、留白充足，不要深色背景、不要品牌 logo。

---

## 3. action-gate.webp — Action 闸门：从 Orchestrator 到 tools 的唯一通路

Skill/style: `guige-svg / architecture / guige-light / 16:9`
Role: section explainer
Intent: 放在“Action 是一等公民”一章，与总览图区分开：只放大 Orchestrator → Permission Engine → tools 这一段，突出 Action 卡片在闸门两侧的变化。

绘制一张 16:9 横版聚焦图，浅色背景。从左到右：

- 左：`Orchestrator`，输出一张卡片 `Action 提议`，卡片上列四行 JetBrains Mono 小字：`tool: jira.create_issue`、`params: {...}`、`tier: 1`、`idempotency_key: 7f3c…`。
- 中（青绿色高亮，粗描边）：`Permission Engine`，内部三个出口：`allow`（青绿箭头向右）、`deny`（灰色箭头折回 Orchestrator，标注 `结构化原因`）、`require_approval`（琥珀色箭头向下到 `Approval Queue`）。
- Approval Queue 内画一把小锁和 `params_hash 冻结`，再引出一个小菱形 `hash 一致？`，是 → 汇入向右的执行箭头；否 → 红色（#f87171）`TAMPERED`。
- 右：`Tool Registry` → `MCP Gateway`（小字：`auth / proxy / sanitize`）→ `MCP Servers`；以及 `Code Sandbox`（小字：`隔离 / 断网 / 资源上限`）。返回箭头标注 `observe` 回到 Orchestrator。
- 底部一条细带：`action_id 贯穿：trace · Audit Log · replay`。

关键约束：Orchestrator 与右侧 tools 之间**绝对不能**出现直连箭头。不要卡通元素，箭头不交叉。

---

## 4. action-lifecycle.webp — Action 生命周期状态机

Skill/style: `guige-svg / flowchart / guige-light / 16:9`
Role: section explainer
Intent: 把正文中的状态机画成一眼能看懂的流程，突出三个分支（deny、allow、require_approval）和“审批后校验 hash”这一步。

绘制一张 16:9 横版状态机流程图，浅色背景，状态用圆角矩形，判定用菱形，状态名用 JetBrains Mono，说明用中文小字。主线从左到右：

`PROPOSED`（模型给出 tool 与参数）→ `VALIDATED`（JSON Schema / tool version）→ 菱形 `policy 判定` 分三路：

- 向上：`deny` → `REJECTED`（结构化原因回给 Orchestrator）
- 向右：`allow` → `EXECUTING`
- 向下：`require_approval` → `WAITING_APPROVAL`（琥珀色）→ 菱形 `审批结果`：`approved` → 小菱形 `hash 一致？`（是 → `EXECUTING`；否 → `TAMPERED` 红色 #f87171）；`rejected` → `REJECTED`；`timeout` → `ESCALATED / EXPIRED`

`EXECUTING`（带 idempotency_key，青绿色高亮）→ `OBSERVED`（sanitize / 截断 / 摘要）→ 终态三选一：`DONE`、`RETRYING`（虚线回到 `EXECUTING`，标注“同一个 idempotency key”）、`FAILED`。

底部一行横向小字条：`每次状态变化 → 写入 trace 与 Audit Log（action_id）`。配色克制：主线深灰，放行路径青绿，审批路径琥珀，异常红色；不要渐变和阴影，箭头不要交叉。

---

## 5. build-order.webp — 两种搭法对比：从 loop 开始 vs 从 Action 开始

Skill/style: `guige-svg / comparison / guige-light / 16:9`
Role: comparison
Intent: 对比两种建设顺序，说明能力可以从简，但 Action 模型后补代价高。

绘制一张 16:9 横版左右对比图，中间一条竖分隔线。

左栏标题：**从 loop 开始**（灰色调）。自上而下的时间轴，5 个节点：`第 1 周：Orchestrator loop + 3 个 tools，demo 很顺` → `上线：重试导致重复 ticket` → `补 idempotency：改每个 tool adapter` → `补审批：参数在审批后被改` → `补追溯：四套 ID、四份日志对不齐`。后三个节点旁加小的红色补丁图标。

右栏标题：**从 Action 开始**（青绿色调）。同样 5 个节点：`第 1 周：Action 记录 + executor 闸门 + 默认拒绝 policy` → `加只读 tools（Tier 0）` → `加可逆写（Tier 1，自动执行 + Audit Log）` → `加外发 Action（Tier 2，进 Approval Queue，冻结 hash）` → `按 action_id 做 tracing、replay、regression evals`。每个节点旁是一个小的绿色对勾。

底部横跨两栏一行结论（字号略大）：**能力可以从简，Action 模型不能后补**。不要卡通人物，不要夸张的“好 / 坏”符号，只用颜色和小图标区分；所有文字清晰可读。

---

## 使用说明

1. `cover.webp` 用 `guige-hand-write-pic` 生成；`agent-platform-architecture.webp` 用 `guige-hand-write-pic`（4:3）；其余三张用 `guige-svg` 生成 SVG 后导出 PNG / WebP（短边不低于 1080px）。
2. 封面使用 9:16 竖图；三张 SVG 示意图使用 16:9 横图。
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）。
4. 文章中已经用 `![描述](文件名.webp)` 格式引用了 `agent-platform-architecture.webp`、`action-gate.webp`、`action-lifecycle.webp`、`build-order.webp`；`cover.webp` 由 frontmatter 的 `image` 字段引用。
