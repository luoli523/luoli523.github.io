# 文章配图生成 Prompt

风格：warm cream-paper sketchnote (hand-drawn-edu)，高密度 (--density high)，6-8 modules per image，**含文本标签**。
配色：warm cream paper background `#F5F0E8`，pastel cards `#A8D8EA / #B5E5CF / #D5C6E0 / #F4C7AB`，coral red `#E8655A` 高亮，black text/outlines，warm gray `#6B6B6B` annotations。

生成后保存到本目录，文件名与文章中引用一致（`.webp` 或 `.png` 均可，会自动转 `.webp`）。

---

## 1. cover.webp — 文章封面

Create a one-page hand-drawn sketchnote cover illustration. Warm cream paper background `#F5F0E8` with slight texture. Centered bold hand-drawn title in black: "从使用者到学习者". Below it in coral red `#E8655A`: "agent-skills 架构深度剖析与高手思维体系". A simple hand-drawn arrow flowing left to right: a small stick figure standing at a desk on the left labeled "使用者 / User" inside a light blue card `#A8D8EA`, then a curved wavy arrow in coral red pointing right, then a stick figure with a magnifying glass examining gears/architecture on the right labeled "学习者 / Learner" inside a mint card `#B5E5CF`. Around the central composition, scatter small sketchnote-style icons with handwritten labels: a stack of cards labeled "21 skills", a small lock labeled "Boundaries", a checklist labeled "Verification", a curly brace labeled "schema", a gear labeled "hooks", a network diagram labeled "6 layers". A footer banner in lavender `#D5C6E0` containing the bold takeaway: "工程纪律 × AI 开发 = 高质量项目". Sketchnote style with slight hand-drawn wobble, doodled stars, underlines for emphasis, dashed connection lines. 16:9 aspect ratio.

---

## 2. architecture-overview.webp — 六层 + 横切 hooks 总览

Create a high-density hand-drawn sketchnote architecture diagram on warm cream paper `#F5F0E8`. Centered bold title at top: "agent-skills 六层架构 + 横切 hooks". Below the title, a vertical stack of 6 horizontal layer cards stacked top to bottom, each as a rounded hand-drawn rectangle with slight wobble:

- Top card peach `#F4C7AB`: "Layer 0 — CLAUDE.md (NAV)" with annotation "44 行 / always in context / 5 段结构"
- Second card light blue `#A8D8EA`: "Layer 1 — using-agent-skills (路由 + 行为宪法)" with annotation "180 行 / 6 条行为 / 10 条 failure modes"
- Third card mint `#B5E5CF`: "Layer 2 — commands (WHEN)" with annotation "7 个 slash / /spec /plan /build /test /review /code-simplify /ship"
- Fourth card lavender `#D5C6E0`: "Layer 3 — agents (WHO)" with annotation "3 个 persona / code-reviewer / security-auditor / test-engineer"
- Fifth card light blue `#A8D8EA`: "Layer 4 — skills (HOW)" with annotation "21 个 SKILL.md / Define→Plan→Build→Verify→Review→Ship"
- Bottom card mint `#B5E5CF`: "Layer 5 — references (DATA)" with annotation "5 个清单 / lazy loading"

On the right side of the stack, a vertical column labeled in coral red `#E8655A`: "Layer X — hooks (AOP)" containing 3 small hand-drawn boxes connected by dashed arrows pointing horizontally INTO the layer stack: "session-start (注入)", "sdd-cache (替换)", "simplify-ignore (遮蔽)". Each hook arrow visually pierces the corresponding layer.

On the left side of the stack, a vertical "token 预算" gauge in warm gray, showing weight increasing from top (small) to bottom (larger). Annotation: "总在 context → 按需加载".

Footer in bold centered: "**6 层垂直 + 1 层横切，每层职责单一，互不重复**". Sketchnote wobble, hand-drawn arrows, doodled accent stars. 16:9 aspect ratio.

---

## 3. meta-skill-dual-role.webp — using-agent-skills 双重职责

Create a hand-drawn sketchnote infographic on warm cream paper `#F5F0E8`. Title at top: "using-agent-skills — meta-skill 的双重职责". Below the title split the canvas into two large rounded cards side by side:

**Left card light blue `#A8D8EA`** titled "① Skill Router (路由器)": Inside, a hand-drawn ASCII-style decision tree with the root "Task arrives" branching into multiple labeled paths in handwritten style — "Don't know what you want? → interview-me", "New project? → spec-driven-development", "Implementing? → incremental-implementation", "Tests? → TDD", "Something broke? → debugging", "Reviewing? → code-review-and-quality", "Deploying? → shipping-and-launch". Connection lines wavy and slightly imperfect, with small arrow doodles.

**Right card mint `#B5E5CF`** titled "② Core Operating Behaviors (行为宪法)": Inside, a numbered list with 6 entries, each as a small annotated row with coral red `#E8655A` numerals:
1. Surface Assumptions → 显式声明假设
2. Manage Confusion Actively → 不能猜，要停下问
3. Push Back When Warranted → 不做 yes-machine
4. Enforce Simplicity → 主动抵抗过度工程
5. Maintain Scope Discipline → 不顺手重构
6. Verify, Don't Assume → 必须验证

Between the two cards at the bottom, a coral red banner: "**1 个 180 行的文件 → 整套系统的操作系统**". Below that, a small annotation card lavender `#D5C6E0`: "Hook 强制注入 every new session". Sketchnote style with slight wobble, doodled stars and underlines. 16:9 aspect ratio.

---

## 4. three-layer-architecture.webp — Skill × Persona × Command 三层关系

Create a hand-drawn sketchnote diagram on warm cream paper `#F5F0E8`. Title at top: "三层架构：Skill × Persona × Command". 

Below, a comparison table styled as three vertical hand-drawn cards side by side:

**Left card mint `#B5E5CF`** — "Skill (HOW)": annotations "方法论 / 步骤 / 退出条件", example pill in coral red "code-review-and-quality", icon: a checklist with checkmarks, label "21 个 skill".

**Middle card lavender `#D5C6E0`** — "Persona (WHO)": annotations "角色 / 视角 / 输出格式", example pill in coral red "code-reviewer", icon: a stick-figure with a name tag, label "3 个 persona".

**Right card peach `#F4C7AB`** — "Command (WHEN)": annotations "用户入口 / 编排器", example pills in coral red "/review" and "/ship", icon: a slash + cursor, label "7 个 command".

Below the three cards, a hand-drawn flow diagram showing a real example trace for "/review":

```
User /review  →  commands/review.md (WHEN)
              →  agents/code-reviewer.md (WHO)
              →  skills/code-review-and-quality (HOW)
              →  references/security-checklist.md (DATA)
```

Each step is a small rounded box with hand-drawn wobble, connected by wavy arrows in warm gray `#6B6B6B`.

On the right, a small callout card in light blue `#A8D8EA`: "**铁律：The user is the orchestrator. Personas do NOT call other personas.**" with the word "NOT" circled in coral red.

Footer takeaway centered bold: "**WHEN → WHO → HOW → DATA，四层完整解构**". Sketchnote style. 16:9 aspect ratio.

---

## 5. hooks-three-modes.webp — hooks 三种干预模式

Create a high-density hand-drawn sketchnote infographic on warm cream paper `#F5F0E8`. Title at top: "Hooks — 三种 AI 干预模式". 

Below the title, three large parallel columns as hand-drawn cards:

**Column 1 light blue `#A8D8EA`** — header "① 注入 (Inject)":
- Hook: `session-start.sh` (24 lines)
- Event: `SessionStart`
- 作用: 把 using-agent-skills 全文塞进首条 system message
- 配套: using-agent-skills
- Doodle: a syringe + arrow flowing into a brain icon

**Column 2 mint `#B5E5CF`** — header "② 替换 (Replace)":
- Hook: `sdd-cache-pre/post.sh` (106 + 135 lines)
- Event: `PreToolUse:WebFetch` + `PostToolUse:WebFetch`
- 作用: HTTP ETag 校验后用缓存替换 WebFetch 结果
- 配套: source-driven-development
- 关键技巧: `exit 2` 当作 in-band 信号
- Doodle: a cache box ↔ origin server with "304 Not Modified" stamp

**Column 3 lavender `#D5C6E0`** — header "③ 遮蔽 (Mask)":
- Hook: `simplify-ignore.sh` (302 lines)
- Event: `Pre Read` + `Post Edit|Write` + `Stop`
- 作用: 用 `BLOCK_<hash>` 占位符遮蔽保护代码
- 配套: code-simplification
- 关键技巧: content hash 让占位符可逆
- Doodle: code lines with one block blacked out + a key icon

Below the three columns, a coral red callout banner: "**核心哲学：不修改 skill，增强 skill (AOP 思想)**".

Below that, three smaller cards side-by-side showing共性原则 in peach `#F4C7AB`:
- "优雅降级 (jq 缺失 → exit 0)"
- "调试日志 (`.debug.log`)"
- "显式失败模式"

Footer takeaway bold centered: "**Hook 作用在协议层，不作用在语义层**". Sketchnote wobble, hand-drawn arrows. 16:9 aspect ratio.

---

## 6. design-philosophies.webp — 三条贯穿系统的设计哲学

Create a hand-drawn sketchnote summary on warm cream paper `#F5F0E8`. Title at top in handwritten bold: "三条贯穿全系统的设计哲学". Below, three large stacked horizontal cards with slight wobble:

**Top card light blue `#A8D8EA`** — "① 委托而非复制 (Never Duplicate)":
- 来源: CLAUDE.md 第 43 行
- 体现:
  - `/build` 委托给 incremental + TDD
  - skills 委托给 references
  - personas 委托给 skills
  - hooks 委托给协议 (exit code)
- 关键引文 in coral red `#E8655A`: "Never duplicate content between skills — reference other skills instead"
- 小图标: 一只手指 → 另一个文档 (pointer 图)

**Middle card mint `#B5E5CF`** — "② 利用协议而非绕过协议":
- 体现:
  - sdd-cache 用 exit code 2 传缓存信号
  - simplify-ignore 直接物理修改文件内容
  - 用 ASCII 决策树触发路由
  - 用 Markdown 模板约束输出
- 关键引文 in coral red: "用 AI 已经会用的语言去约束 AI"
- 小图标: 一把钥匙插进一个标准接口

**Bottom card lavender `#D5C6E0`** — "③ 用反例教学定义边界":
- 体现:
  - agents/README.md 画了完整的反例 (meta-orchestrator)
  - 每个 skill 都有 Common Rationalizations 表
  - 每个 skill 都有 Red Flags 段
  - SKILL.md schema 强制要求反模式说明
- 关键引文 in coral red: "正例告诉读者做什么，反例告诉读者边界在哪里"
- 小图标: 红色叉号 + 绿色对勾并排，箭头指向边界线

底部 footer 居中加粗: "**每一层、每一个文件、每一行规则都服务这三条哲学**". Sketchnote style with doodled stars, hand-drawn underlines, wavy arrows between cards. 16:9 aspect ratio.

---

## 使用说明

1. 将上述 prompt 分别输入支持 hand-drawn / sketchnote 风格的图片生成工具（Midjourney、DALL-E、Nano Banana、Ideogram、guige-imagen 等）
2. 建议使用 16:9 比例，分辨率至少 1920x1080
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）
4. 文章中已经用 `![描述](文件名.webp)` 格式引用了这些图片，生成后即可自动展示
