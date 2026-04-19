# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 .webp 或 .png（会自动转为 .webp），文件名与文章中引用一致。

共 6 张配图，风格保持一致：**深色主题、科技感、极简干净**，暗底色 `#07090f`，主要点缀色 teal `#2dd4bf`，次要点缀 amber `#f59e0b` / purple `#a78bfa`。

---

## 1. cover.webp — 文章封面

A clean minimal tech illustration depicting an open book transforming into a digital index / map, with chapter-like cards floating out of its pages. Each card represents a category (API, Tools, Agents, Skills, Eval) with glowing teal lines connecting them into a navigable knowledge graph. Dark navy background (#07090f), primary teal accent (#2dd4bf) glow on the connections, subtle amber (#f59e0b) highlights on a few key cards. Isometric perspective, subtle grid pattern in background, feels like a developer's documentation dashboard. Clean, elegant, no clutter. No text. 16:9 aspect ratio.

---

## 2. overview.webp — 全景分类结构图

A clean minimal tree-structure / mind-map diagram visualizing the 8 top-level categories of a cookbook repository. Central node labeled in abstract (no actual text needed), branching out into 8 sub-branches representing: Capabilities, Tool Use, Performance, Agents (with 3 sub-branches), Skills, Third-party, Evaluation, Engineering. Dark navy background (#07090f), teal (#2dd4bf) primary branches with glow, amber (#f59e0b) highlights on the Agent branch to emphasize its three sub-layers. Thin elegant lines, small geometric node icons, minimal style. Feels like a system architecture diagram. No text. 16:9 aspect ratio.

---

## 3. tool-use.webp — Tool Use 分层图

A clean diagram showing two layers of "tool use" patterns stacked vertically. Top layer labeled abstractly as "Basics" with 5-6 small icon nodes (calculator, parallel arrows, JSON brackets, choice fork). Bottom layer labeled "Advanced" with 4-5 more complex nodes (memory storage icon, code brackets for PTC, embedding dots for tool search, compression arrows). Teal (#2dd4bf) connecting lines between the two layers showing progression. Dark navy background (#07090f), clean geometric style, soft glow. Minimal and elegant. No text. 16:9 aspect ratio.

---

## 4. agents-layers.webp — Agent 三层架构图

A clean isometric illustration showing three stacked horizontal layers representing progression from lightweight to heavyweight agent implementations. Bottom layer: thin and simple, represents "patterns / concepts" with a few abstract pattern icons. Middle layer: medium thickness, represents "SDK" with code/gear icons. Top layer: thickest, represents "Managed Runtime" with server/cloud/container icons. Arrows on the side showing "freedom decreases, engineering decreases" from bottom to top. Dark navy background (#07090f), teal (#2dd4bf) for SDK layer, amber (#f59e0b) for managed layer, purple (#a78bfa) for patterns layer. Clean, technical, like a stack diagram. No text. 16:9 aspect ratio.

---

## 5. engineering.webp — 仓库工程实践流程图

A clean minimal workflow diagram showing a notebook-driven repository's engineering practices. Show circular/hexagonal nodes for: package manager (uv), linter (ruff), pre-commit hook, registry.yaml (as a database icon), slash commands (as terminal prompts), CI validation. Arrows connecting them into a flow that loops back. Dark navy background (#07090f), teal (#2dd4bf) for primary flow, amber (#f59e0b) for CI/validation stage. Clean geometric icons, elegant lines, feels like a DevOps pipeline visualization. Minimal and technical. No text. 16:9 aspect ratio.

---

## 6. roadmap.webp — 学习路径图

A clean illustration showing three parallel horizontal paths/tracks, each representing a learner persona journey. Each track has 4 waypoint nodes spaced along it, connected by teal dotted lines. The three tracks are visually distinct by color tint: top track (teal #2dd4bf) for "API beginner", middle track (amber #f59e0b) for "Claude Code user extending to agents", bottom track (purple #a78bfa) for "B2B agent product builder". Each waypoint is a small geometric icon. All three tracks converge at a single endpoint on the right side symbolizing mastery. Dark navy background (#07090f), clean and aspirational, feels like a learning roadmap or journey map. No text. 16:9 aspect ratio.

---

## 使用说明

1. 将上述 prompt 分别输入 AI 图片生成工具（如 Midjourney, DALL-E, Ideogram, GPT-Image 等）
2. 建议使用 16:9 比例，分辨率至少 1920x1080
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）
4. 文件名严格对应：`cover.webp` / `overview.webp` / `tool-use.webp` / `agents-layers.webp` / `engineering.webp` / `roadmap.webp`
5. 文章中已经用 `![](文件名.webp)` 格式引用了这些图片
