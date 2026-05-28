# 手册配图生成 Prompt

风格：warm cream-paper sketchnote (hand-drawn-edu)，高密度 (--density high)，含文本标签。
配色：warm cream paper background `#F5F0E8`，pastel cards `#A8D8EA / #B5E5CF / #D5C6E0 / #F4C7AB`，coral red `#E8655A` 高亮，black text/outlines，warm gray `#6B6B6B` annotations。

生成后保存到本目录，文件名与文章中引用一致。

---

## 1. cover.webp — 手册封面

Create a one-page hand-drawn sketchnote cover for a technical handbook on warm cream paper `#F5F0E8`. Centered bold hand-drawn title in black: "agent-skills 项目手册". Below it in coral red `#E8655A`: "六层架构的极致颗粒度参考". 

Below the title, an open hand-drawn book illustration occupies the center. The left page shows a partial table-of-contents list with section markers: "0 导读", "1 架构总览", "2 CLAUDE.md", "3 using-agent-skills", "4 commands", "5 agents", "6 skills", "7 references", "8 hooks", "9 索引". The right page shows a small sketch of the 6-layer stack: 6 stacked horizontal cards in alternating pastel colors (peach/blue/mint/lavender) labeled L0-L5, with a vertical "hooks" annotation arrow piercing them from the side in coral red. 

Around the book, scatter small handwritten labels and doodled icons: a magnifying glass labeled "颗粒度", a stack of files labeled "21 skills / 7 commands / 5 refs", a bookmark labeled "查阅手册", a small question-mark icon labeled "查不到？翻索引". 

Footer banner in lavender `#D5C6E0` with bold takeaway: "**翻到某一层 → 看那一节 → 找到该改的文件**". Sketchnote style with hand-drawn wobble, doodled stars, dashed connection lines. 16:9 aspect ratio.

---

## 2. directory-tree.webp — 完整目录树

Create a high-density hand-drawn sketchnote infographic on warm cream paper `#F5F0E8`. Title at top: "agent-skills 完整目录结构". 

Below the title, render a hand-drawn ASCII-style directory tree centered on the page, with handwritten font style and slight wobble. Each directory is a rounded box in pastel color:

```
agent-skills/
├── CLAUDE.md                    44 行   [peach]
├── skills/                      21 个   [light blue]
│   └── SKILL.md per directory
├── agents/                       3 个   [mint]
│   ├── README.md                120 行
│   ├── code-reviewer.md          97 行
│   ├── security-auditor.md     101 行
│   └── test-engineer.md          95 行
├── references/                   5 个   [lavender]
│   ├── security-checklist.md   134 行
│   ├── performance-checklist.md 153 行
│   ├── accessibility-checklist.md 160 行
│   ├── testing-patterns.md     236 行
│   └── orchestration-patterns.md 370 行
├── hooks/                        3 个   [peach]
│   ├── session-start.sh         24 行
│   ├── sdd-cache-{pre,post}.sh 106+135 行
│   └── simplify-ignore.sh      302 行
└── .claude/commands/             7 个   [light blue]
    ├── /spec, /plan, /build
    ├── /test, /review, /code-simplify
    └── /ship                    73 行 ★
```

Around the tree, add handwritten annotations with arrows in warm gray `#6B6B6B`:
- arrow pointing to `CLAUDE.md`: "总入口 / always in context"
- arrow pointing to `skills/`: "21 个 SKILL.md，按 phase 组织"
- arrow pointing to `agents/`: "3 个 persona / 视角层"
- arrow pointing to `references/`: "无 frontmatter / lazy loading"
- arrow pointing to `hooks/`: "横切干预 / AOP"
- arrow pointing to `/ship`: "Fan-out 编排器 ★"

In a coral red side panel: "Total: ~50 个核心文件，但是一个精密的工程系统".

Footer takeaway centered bold: "**少而精：每个文件职责单一，互不重复**". Sketchnote wobble, hand-drawn underlines. 16:9 aspect ratio.

---

## 3. claude-md-detailed.webp — CLAUDE.md 五段拆解

Create a hand-drawn sketchnote infographic on warm cream paper `#F5F0E8`. Title at top: "CLAUDE.md — 44 行的导航极简主义". Subtitle in warm gray: "5 段结构 / 不重复任何下游内容".

Below the title, a vertical stack of 5 hand-drawn rounded sections, each labeled with a section header + key content + small doodle icon:

**Section 1 light blue `#A8D8EA`** — "① Project Structure":
- 6 行 ASCII 树
- 每行 = 目录 + 一句话
- 隐式优先级：skills 在前 docs 在后
- Doodle: 一棵小树

**Section 2 mint `#B5E5CF`** — "② Skills by Phase":
- 6 个 phase: Define/Plan/Build/Verify/Review/Ship
- 21 个 skill 名字
- 与决策树对齐（但 code-simplification 缺失）
- Doodle: 6 节火车厢

**Section 3 lavender `#D5C6E0`** — "③ Conventions（核心 schema）":
- 6 条规则
- L30 强制 SKILL.md 6 段式结构 ★ (coral red star)
- L32 100 行拆分阈值
- Doodle: 一份合同 + 印章

**Section 4 peach `#F4C7AB`** — "④ Commands":
- 显式声明 `npm test` Not applicable
- 仓库实际验证 = frontmatter 校验
- Doodle: 一个检查清单

**Section 5 light blue `#A8D8EA`** — "⑤ Boundaries":
- Always: skill-anatomy 格式
- Never: vague advice
- Never: Duplicate content ← **整个仓库的指针架构根源** (coral red)
- Doodle: 三道防线

On the right side, a vertical coral red callout strip: "**核心判断：CLAUDE.md 是"导航层"，不是"内容层"**".

Footer takeaway bold centered: "**44 行 → 撑起整个仓库的形态**". Sketchnote style with hand-drawn arrows. 16:9 aspect ratio.

---

## 4. skills-schema-six-section.webp — SKILL.md 强制 6 段式 schema

Create a high-density hand-drawn sketchnote diagram on warm cream paper `#F5F0E8`. Title at top: "SKILL.md 强制 6 段式 Schema (来源：CLAUDE.md L30)". 

In the center, a large hand-drawn rounded "document" outline with 6 internal sections stacked vertically, each as a pastel-colored band:

**Band 1 light blue `#A8D8EA`** — "Overview"
- Annotation: "这个 skill 是干什么的"
- 防止: AI 不理解 skill 的存在意义

**Band 2 mint `#B5E5CF`** — "When to Use"
- Annotation: "含 When NOT to use 反向条件"
- 防止: AI 在错误场景套用

**Band 3 peach `#F4C7AB`** — "Process"
- Annotation: "具体步骤 / 数字列表 / 可执行"
- 防止: AI 跳过关键步骤

**Band 4 coral red `#E8655A`** — "Common Rationalizations" ★
- Annotation: "两栏对照表：借口 vs 反驳"
- 防止: AI 用借口跳过整个 skill
- (注：这一段用 coral red 高亮，标 ★)

**Band 5 lavender `#D5C6E0`** — "Red Flags"
- Annotation: "反模式症状清单"
- 防止: AI 在偏离时没察觉

**Band 6 light blue `#A8D8EA`** — "Verification"
- Annotation: "boolean 可判定的 checkbox"
- 防止: AI 提前宣布完成

To the right of the document, a vertical callout column listing principles in warm gray:
- "21 个 SKILL.md 必须遵守"
- "唯一例外：using-agent-skills"
- "没有任何一段是装饰"

At the bottom, a small coral red banner showing the example Common Rationalizations format:

```
| Rationalization        | Reality                |
|------------------------|------------------------|
| "This is simple, ..."  | "Two-line spec is OK"  |
```

Footer takeaway bold centered: "**Schema 不是模板，是合同**". Sketchnote wobble, hand-drawn underlines, doodled stars. 16:9 aspect ratio.

---

## 5. references-citation-network.webp — references 引用关系网

Create a hand-drawn sketchnote network diagram on warm cream paper `#F5F0E8`. Title at top: "references 引用关系网 — lazy loading 数据层".

Create a network visualization with 5 reference files arranged in the center as hand-drawn rounded cards:

**Center bottom**: `orchestration-patterns.md` (370 行) — largest card in coral red border `#E8655A`, annotated "★ 架构铁律 / 被三层引用"

**Around it (4 corners)**:
- Top-left `security-checklist.md` (134 行) — light blue `#A8D8EA`
- Top-right `performance-checklist.md` (153 行) — mint `#B5E5CF`
- Bottom-left `accessibility-checklist.md` (160 行) — lavender `#D5C6E0`
- Bottom-right `testing-patterns.md` (236 行) — peach `#F4C7AB`

On the left margin, a column of "引用方" (callers) as small skill/agent boxes:
- "shipping-and-launch"
- "code-review-and-quality"
- "security-and-hardening"
- "performance-optimization"
- "frontend-ui-engineering"
- "test-driven-development"
- "doubt-driven-development"
- "agents/README.md"
- "commands/ship.md"

Draw dashed arrows in warm gray `#6B6B6B` from each caller to the reference(s) they cite. The arrows to `orchestration-patterns.md` should be in coral red `#E8655A` to highlight its centrality. Annotation on one arrow: "纯文本路径 / 无自动加载机制".

In a top-right callout box: "所有 references 无 YAML frontmatter ← 不被自动发现".

In a bottom callout box: "100 行阈值：内容 < 100 行 → 留在 skill；≥ 100 行 → 拆出来".

Footer takeaway bold centered: "**自然语言路径 + AI 自己决定何时读 = 完美的 lazy loading**". Sketchnote style. 16:9 aspect ratio.

---

## 6. hook-event-protocol.webp — hooks 与 Claude Code 协议

Create a high-density hand-drawn sketchnote technical diagram on warm cream paper `#F5F0E8`. Title at top: "hooks 与 Claude Code 协议".

Below the title, two main sections side by side:

**Left section (60%)** — "Hook 事件 → 干预模式" mapping table styled as hand-drawn rows:

Row 1 light blue `#A8D8EA`:
- Hook: session-start.sh (24 行)
- Event: `SessionStart`
- Mode: **注入** (Inject)
- 配套: using-agent-skills

Row 2 mint `#B5E5CF`:
- Hook: sdd-cache-{pre,post}.sh (241 行)
- Event: `PreToolUse:WebFetch` / `PostToolUse:WebFetch`
- Mode: **替换** (Replace)
- 配套: source-driven-development

Row 3 lavender `#D5C6E0`:
- Hook: simplify-ignore.sh (302 行)
- Event: `Pre Read` / `Post Edit|Write` / `Stop`
- Mode: **遮蔽** (Mask)
- 配套: code-simplification

**Right section (40%)** — "Hook 协议 / exit code 含义" as a stacked exit-code card:

A hand-drawn box titled "Hook Exit Codes" in peach `#F4C7AB`, containing rows:
- `exit 0` → 放行（让工具正常执行）
- `exit 2` → **阻止 + 把 stderr 传回 agent** ★ (coral red)
- 其他 → 错误（视情况而定）

Below it a small annotated example showing sdd-cache 使用 `exit 2`:
```
[sdd-cache] Cache hit for <url>
Revalidated via HTTP 304.
----- BEGIN CACHED CONTENT -----
<actual content>
----- END CACHED CONTENT -----
exit 2  ← "缓存命中" 伪装成 "工具被拒"
```

At the bottom, a horizontal banner with three共性原则 in coral red:
- "① 优雅降级 (jq 缺失 → exit 0)"
- "② 调试日志 (`.debug.log`)"
- "③ 与具体 skill 一对一绑定"

Footer takeaway bold centered: "**Hook 作用在协议层 / 不修改 skill / 增强 skill (AOP)**". Sketchnote wobble, hand-drawn arrows, doodled accent stars. 16:9 aspect ratio.

---

## 使用说明

1. 将上述 prompt 分别输入支持 hand-drawn / sketchnote 风格的图片生成工具（Midjourney、DALL-E、Nano Banana、Ideogram、guige-imagen 等）
2. 建议使用 16:9 比例，分辨率至少 1920x1080
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）
4. 文章中已经用 `![描述](文件名.webp)` 格式引用了这些图片，生成后即可自动展示
