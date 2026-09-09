# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 `.webp` 或 `.png`（会自动转为 `.webp`），文件名与文章中引用一致。

## 视觉方案

- Primary skill: `guige-svg`
- Primary style/layout/aspect: light workflow diagrams / warm editorial paper / landscape 16:9
- Why: 文章的核心交付物是多 Bot 的路由、交接合同和共享安全边界，精确的流程与结构图比装饰性机器人插画更有帮助。
- Per-image overrides: `cover.webp` 使用 `guige-infographic / clean-explainer / landscape 16:9`；`handoff-contract.webp` 使用 `guige-hand-write-pic / hand-drawn-edu / landscape 16:9`。

统一视觉规范：暖白纸张背景，墨蓝文字与线条，青绿色表示 verified/PASS，琥珀色表示 working/needs review，克制的红色表示 unverified/BLOCKED。正文中文采用 Noto Serif SC 气质，字段名和状态采用 JetBrains Mono 气质。不要使用原帖中的影视剧截图、Grok/xAI Logo、仿产品 UI 或真人肖像；不要把多个 Bot 画成具有人类身份的“员工”。

---

## 1. cover.webp — 文章封面

Skill/style: `guige-infographic / clean-explainer / landscape 16:9`
Role: cover
Intent: 一眼表达“多 Agent 成败取决于交接，而不是 Bot 数量”。

设计一张中文技术博客横版封面。画面中央是一条窄桥或接缝，从左到右依次放置 Researcher、HANDOFF、Writer、HANDOFF、Checker；桥下散落几张缺少来源、状态不明、写着 `unverified` 的纸片，表示松散交接会丢信息。最上方有一个较小的 Coordinator 路由节点，只连接和跟踪，不亲自生产内容。整体克制、清晰、有轻微工程手稿感。

只放主标题“先把交接协议写清楚”和副标签“3 Bots · 2 Handoffs · 1 Result”。文字必须清晰，不放品牌 Logo、长段小字或夸张的机器人形象。

---

## 2. three-bot-chain.webp — 最小三 Bot 协作链

Skill/style: `guige-svg / architecture + sequence / landscape 16:9`
Role: architecture
Intent: 让读者看懂 Coordinator、Researcher、Writer、Checker 的职责和两次核心交接。

绘制一张横向流程架构图。顶部放一个 Coordinator 节点，标注“唯一入口 / dispatch / status / conflict / final result”，并用虚线连接三个专业 Bot。主体从左到右：Researcher → HANDOFF 1 → Writer → HANDOFF 2 → Checker → Coordinator。每个专业节点下方写一行职责：Researcher“来源与验证”、Writer“仅从 verified 起草”、Checker“逐条对源 / PASS or BLOCKED”。

在两份 HANDOFF 卡片上显示短字段：`verified`、`unverified`、`skipped`、`artifacts`、`next_action`。用青绿色路径表示成功链路，红色小箭头表示无来源断言被 Checker 拦截。强调每阶段 `one owner`，不要画并行的两个 Writer。

---

## 3. handoff-contract.webp — HANDOFF 交接合同

Skill/style: `guige-hand-write-pic / hand-drawn-edu / landscape 16:9`
Role: practical checklist
Intent: 把 HANDOFF 的关键字段做成适合保存和复查的横版知识卡。

绘制一张暖色手绘教育卡片，主体是一份纸质交接单，按四个区域组织：

1. 任务身份：`task_id`、`from`、`to`、`status`；
2. 已知结果：`result`、`verified + source`、`artifacts`；
3. 明示缺口：`unverified`、`skipped`、`risks`，用克制红色边框；
4. 下一步：`next_action`、`approval_required`，用琥珀色与青绿色箭头。

顶部标题“传结果，不传工作过程”，底部短句“缺口必须有名字”。用勾选框、回形针、来源链接符号和 BLOCKED/PASS 小印章增强可读性。所有字段名必须拼写准确，不出现大段正文。

---

## 4. shared-computer-boundary.webp — 多 Bot 的共享电脑边界

Skill/style: `guige-svg / security boundary diagram / landscape 16:9`
Role: security
Intent: 明确多个 Grok Bots 是角色隔离，不是计算机和凭据隔离。

绘制一张横向安全边界图。左侧是同一个 User Account；中间是四个不同颜色但同级的 Bot 角色卡：Coordinator、Researcher、Writer、Checker；它们全部进入右侧同一个大边界框“Shared persistent cloud computer”。边界框内包含 `files`、`browser sessions`、`logins`、`connected tools` 四类共享资源。

在 Bot 角色之间标注“separate roles & conversations”，在共享电脑外框上标注“NOT a security boundary”。下方画出三道真实控制：Scoped accounts、Human approval、Sign out / clean temporary files。用红色禁止符号划掉“New Bot = isolated credentials”。图要专业、克制、易读，不使用锁头堆叠或黑客风格。

---

## 使用说明

1. 将上述 prompt 分别输入对应的图片生成或 SVG 工具。
2. 四张图片统一使用 16:9。
3. 栅格图片短边至少 1080px，生成后保存到本目录；PNG 或 WebP 均可。
4. 文件名必须为 `cover.webp`、`three-bot-chain.webp`、`handoff-contract.webp`、`shared-computer-boundary.webp`。
5. 不复用原帖中的影视素材；文章中的关键配置仍以可复制文本保留，不依赖图片传递。
