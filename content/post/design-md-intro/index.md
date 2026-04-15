---
title: 'DESIGN.md：让 AI 拥有"设计品味"的新标准'
description: "一个 markdown 文件，51,000 颗 star。Google Stitch 发明的 DESIGN.md 概念，正在成为 AI Coding Agent 时代的设计系统新标准——本文带你完整理解它是什么、为什么有效，以及如何立刻用在你的项目里。"
date: 2026-04-12
slug: design-md-intro
image: cover.webp
categories:
    - AI
tags:
    - AI
    - UI设计
    - Design System
    - Claude Code
    - 前端
---

> 一个 markdown 文件，**51,000 颗 star**，**6,300 个 fork**。
>
> 这大概是 2026 年最被低估的 AI 工程概念。

你让 Claude Code 生成一个登录页，它给你一坨"能用但丑陋"的 Bootstrap 味 UI。你让 Cursor 给你做个 dashboard，它给你另一坨"能用但丑陋"的 Bootstrap 味 UI。

**AI 会写代码，但 AI 没有品味。**

除非——你给它一份 DESIGN.md。

---

## 一、一切从 Google Stitch 的一个小改动说起

2026 年初，Google 悄悄给它的 AI 设计工具 [Stitch](https://stitch.withgoogle.com/) 引入了一个新概念：**DESIGN.md**。

定位很简单：

> **AGENTS.md** 告诉 AI Coding Agent **怎么建**项目；
> **DESIGN.md** 告诉 AI Design Agent 项目**长什么样**。

两个 markdown 文件，分工明确——一个管工程，一个管审美。

然后事情就有点失控了。一个叫 VoltAgent 的团队开了个 GitHub 仓库 [awesome-design-md](https://github.com/VoltAgent/awesome-design-md)，从真实网站里"提取"66 个主流品牌的 DESIGN.md，免费开源。两个月，冲到 51k stars。

![awesome-design-md 仓库 star 数截图](repo-screenshot.webp)

你可以在里面找到：**Claude**、**Vercel**、**Linear**、**Notion**、**Stripe**、**Apple**、**Airbnb**、**Figma**、**Supabase**、**Raycast**、**Cursor**、**Warp**、**OpenAI**、**xAI**……几乎你叫得上名字的现代科技品牌都在里面。

---

## 二、DESIGN.md 到底是什么？

**它就是一个 markdown 文件。**

没有 Figma 插件，没有 JSON schema，没有 Tailwind 配置，没有 design tokens，没有任何工具链。就是一个 `DESIGN.md`，丢在你的项目根目录，和 `README.md` 并排放着。

一份典型的 DESIGN.md 里有这些内容：

- **视觉主题与氛围**（比如 Claude 是 "warm terracotta accent, clean editorial layout"）
- **色板** + 每个颜色的语义角色
- **字体层级**（字号、字重、行高）
- **组件样式**（按钮、卡片、输入框、导航）
- **间距与布局原则**
- **阴影与层级系统**
- **设计边界**（该做什么 / 不该做什么）
- **响应式断点**
- **给 AI Agent 的 prompt 指引**

看起来和传统的设计规范文档差不多？**关键不在内容，关键在格式。**

---

## 三、为什么是 Markdown？

这是整个概念最"反直觉"的地方。

### 对比一下主流方案

| 方案 | 机器可读性 | AI 理解度 | 人可读性 | 落地成本 |
|------|----------|----------|---------|---------|
| **Figma 导出** | 高 | 低（需要插件） | 中（要开软件） | 高 |
| **Design Tokens JSON** | 高 | 中 | 低 | 中 |
| **Tailwind Config** | 高 | 中 | 中 | 中 |
| **DESIGN.md** | 中 | **极高** | **极高** | **几乎为零** |

你发现了吗？**对 LLM 最友好的格式，不是最"结构化"的格式，而是它训练时见得最多的格式——自然语言 + markdown。**

### 用 prose 描述设计，比用 JSON 更准确

对比两种写法，说"按钮的 hover 状态要有一点点活力，但不能太跳跃"：

**JSON 写法**：
```json
{
  "button": {
    "hover": {
      "transform": "translateY(-1px)",
      "transition": "all 150ms ease",
      "boxShadow": "0 4px 12px rgba(0,0,0,0.08)"
    }
  }
}
```

**DESIGN.md 写法**：
```markdown
## Buttons

Hover state should feel **alive but restrained**—a subtle lift of 1px
with a soft shadow. Never bouncy or playful. The goal is "confident
acknowledgement," not "look at me."
```

哪一种更能让 AI 理解"克制的活力"？

JSON 写法告诉你**怎么做**，但没告诉你**为什么**——AI 只能机械复刻，不能举一反三。markdown 写法把**意图**交给了 AI，换一个组件、换一个场景，它能自己推导出一致的风格。

**这就是 DESIGN.md 的核心洞察：LLM 需要的是"设计语义"，不是"设计数值"。**

---

## 四、一份真实的 DESIGN.md 长什么样

我们看一下 Claude 品牌的 DESIGN.md 片段（节选自 `getdesign.md/claude/design-md`）：

![Claude DESIGN.md 片段](claude-design-md-sample.webp)

关键 section 的写法：

```markdown
# Claude Design System

## Visual Atmosphere

Editorial warmth meets AI precision. The palette feels like a vintage
book in a modern library—warm cream paper, sepia ink, a single terracotta
accent that signals "this is where intelligence lives."

## Color Palette

- **Background**: Cream white (#faf9f5) — never pure white
- **Text primary**: Deep charcoal (#1f1e1c) — never pure black
- **Accent**: Terracotta (#d97757) — used sparingly, for CTAs and highlights
- **Muted**: Sepia gray (#8a7f72) — for secondary text and borders

**Rule**: If you're reaching for pure #000 or #fff, stop. This design
system lives in the warm middle.

## Typography

Use Tiempos Text for body (serif, generous line-height).
Use Styrene for UI and headings (sans-serif, tight tracking).
Never mix more than two font families. Never use bold on serif body.

## Component: Chat Bubble

User messages: terracotta background, cream text, 14px radius.
Claude responses: cream background, charcoal text, no bubble border.
The asymmetry is intentional—it keeps the AI's responses "in the
paper," not "on top of the paper."
```

注意几个细节：

1. **每个色值都带"为什么"**：不只是 `#faf9f5`，而是 "cream white, never pure white"。AI 读到这句，就知道选色时要偏暖偏柔，永远别往纯白靠
2. **规则是用散文写的**："If you're reaching for pure #000 or #fff, stop."——这种表达方式 JSON 写不出来
3. **语义 > 数值**："The asymmetry is intentional"——这句话决定了 AI 遇到新组件时的判断标准

**这就是为什么 AI 读了 DESIGN.md 之后，生成的 UI 真的会"有品味"。**

---

## 五、实战：在 Claude Code 里用 DESIGN.md

理论讲完了，看怎么用。以 Claude Code 为例，30 秒上手。

### Step 1：挑一个你喜欢的品牌

去 [awesome-design-md](https://github.com/VoltAgent/awesome-design-md) 的 README 里浏览 66 个品牌。选一个风格接近你目标项目的——比如我要做一个极简的 SaaS 落地页，选 Linear 或 Vercel。

### Step 2：下载 DESIGN.md 到项目根目录

访问对应品牌的 URL（比如 `https://getdesign.md/linear.app/design-md`），复制 markdown 内容保存为 `DESIGN.md`，放在项目根目录：

```
my-project/
├── CLAUDE.md
├── DESIGN.md    ← 新增
├── package.json
└── src/
```

### Step 3：在 CLAUDE.md 里引用它

编辑你项目的 `CLAUDE.md`，加一行：

```markdown
## Design System

All UI work must follow `DESIGN.md` at the project root.
When generating components, read DESIGN.md first and match its
color palette, typography, component rules, and atmosphere exactly.
```

### Step 4：让 Claude Code 生成 UI

```
你：帮我做一个 pricing page，三档套餐，带年付/月付切换
```

Claude Code 会先读 `DESIGN.md`，然后生成的代码会：

- 颜色自动用 Linear 的 `#5e6ad2` 紫色做 accent
- 字体层级严格匹配 Linear 的 Inter + tight tracking
- 按钮的 hover 状态带 Linear 标志性的 "subtle glow"
- 整体氛围是 Linear 那种 "ultra-minimal, precise"

![Claude Code 生成效果对比](generated-ui-compare.webp)

**最关键的是——如果你让它继续做一个 dashboard 页面，它会自动保持一致的风格。** 因为 DESIGN.md 给了它"世界观"，不是零散的 tokens。

---

## 六、它的局限与边界

我不想把这篇写成纯 hype 贴。DESIGN.md 不是银弹，有几个场景它就是不适合：

**1. 精准交互动效**：如果你想要"按下按钮后 300ms 内显示 ripple，持续 200ms 后消散"，这种精确到毫秒的规格，markdown 不如 JSON token

**2. 不能代替 Design Review**：AI 生成的 UI 看起来对了，不等于好用。信息层级、可用性、无障碍——这些还得人来把关

**3. 同质化风险**：如果大家都抄 Linear 或 Vercel 的 DESIGN.md，互联网上的 AI 生成页面会越来越像

**4. 对"极致精细"场景不够**：Apple、Stripe 那种对每个像素都有要求的品牌，光靠 DESIGN.md 不够——你需要人类设计师 + DESIGN.md 双保险

**5. 跨 Agent 的兼容性还不稳**：不同 AI（Claude、Cursor、Lovable、Stitch）对 DESIGN.md 的理解深度不一样，效果会有差异

但这些局限不妨碍一个事实：**DESIGN.md 把"让 AI 做出有品味的 UI"这件事，从一项玄学变成了一项工程。**

---

## 七、为什么我觉得这是个大事

如果你退一步看，DESIGN.md 背后是一种更根本的转变：

**过去**：设计系统是给**设计师和前端工程师**读的。内容是 Figma、Storybook、Design Tokens。

**现在**：设计系统的**第一读者变成了 AI Agent**。内容必须是 LLM 能原生理解的格式——也就是 markdown + prose。

这个转变和 `CLAUDE.md` / `AGENTS.md` 的兴起是同一条逻辑：**当 AI 成为团队里最"勤快"的那个成员，你得用它听得懂的语言，写给它看的文档**。

未来你可能会看到每个项目根目录都有这么一套：

```
├── README.md        ← 给人类看
├── CLAUDE.md        ← 给 Claude Code 看（项目规则）
├── AGENTS.md        ← 给所有 coding agent 看（构建指南）
├── DESIGN.md        ← 给 design agent 看（视觉系统）
```

**文档即接口，markdown 即 API。** 这是 AI-first 工程时代的新常态。

---

## 八、立刻动手：本周做一件事

回顾一下 DESIGN.md 为什么值得你关注：

1. **一个 markdown 文件** = 一个完整的设计系统
2. **LLM 原生理解** prose + markdown，比 JSON / Figma 效果更好
3. **66 个主流品牌模板开源**，免费可用
4. **30 秒集成** 进任何 AI Coding 工作流
5. **从"没品味的 AI"到"有品味的 AI"** 之间，就隔了这一个文件

**如果你也在用 Claude Code / Cursor / Lovable 做前端，这周就做一件事**：

> 1. 打开 [awesome-design-md](https://github.com/VoltAgent/awesome-design-md)
> 2. 挑一个你喜欢的品牌（我个人推荐 Linear、Vercel、或 Claude）
> 3. 下载它的 DESIGN.md，放到你正在做的项目根目录
> 4. 下次让 AI 生成 UI 组件时，对比有/没有 DESIGN.md 的效果

你会发现——**AI 突然"有品味"了**。

---

## 参考资料

- [awesome-design-md（GitHub 仓库）](https://github.com/VoltAgent/awesome-design-md)
- [getdesign.md（完整在线模板库）](https://getdesign.md/)
- [Google Stitch 官方 DESIGN.md 文档](https://stitch.withgoogle.com/docs/design-md/overview/)
- [跟鬼哥一起玩 Claude Code](https://claude-code.luoli523.com)
