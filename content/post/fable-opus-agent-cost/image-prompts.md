# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 .webp 或 .png（会自动转为 .webp），文件名与文章中引用一致。

统一视觉风格：深色科技感，背景使用 deep dark navy `#07090f` 或 `#0d1117`，主强调色 teal `#2dd4bf`，辅助色 amber `#f59e0b`，少量 purple `#a78bfa` 和 red `#f87171`。Clean tech illustration, dark mode aesthetic, minimal and elegant, high contrast, crisp edges, premium engineering blog cover style. 9:16 aspect ratio, at least 1080x1920.

统一人物形象：使用 `~/Downloads/guige.png` 作为鬼哥参考形象。每张图中都加入鬼哥作为讲解者、工程师、架构师或调度者角色，保持参考图的发型、脸型、气质和整体识别度，但可以根据场景调整姿势和服装细节。不要生成写实照片，保持高级科技插画风。

---

## 1. cover.webp — 文章封面

Create a vertical 9:16 clean tech illustration for a Chinese engineering blog article titled "别让 Fable/Opus 干杂活：Agent 系统的省钱架构". Use the provided Gui Ge reference image as the recognizable presenter character, standing beside the system diagram with a slightly amused expression. Visual metaphor: a powerful futuristic cannon labeled "Fable / Opus" is absurdly aimed at a tiny fly-like task icon made of documents, tables, and web pages, while a calm orchestration dashboard in the background routes tasks to smaller worker nodes. Dark navy background #07090f, teal #2dd4bf primary highlights, amber #f59e0b warning accents, minimal elegant composition. Include short legible Chinese title text: "别让 Fable/Opus 干杂活". Avoid clutter, no photorealistic violence, no real insects; use abstract task icon instead.

---

## 2. monolith-agent.webp — 单体 Agent 过载

Create a vertical 9:16 clean tech illustration showing Gui Ge, based on the provided reference image, looking at a single oversized AI agent core overwhelmed by many floating web pages, code snippets, pricing tables, logs, and browser windows. The central node is glowing but overloaded, with tangled lines and warning signals. Dark mode tech aesthetic, navy #07090f background, teal primary glow, amber and red overload accents. The idea is "monolithic agent doing every job". Optional short text label: "单体 Agent 过载". Keep text minimal and legible.

---

## 3. advisor-pattern.webp — Advisor 模式

Create a vertical 9:16 system architecture illustration. Gui Ge, based on the provided reference image, acts as the engineer orchestrating the workflow. A Sonnet executor node is driving a workflow path with tools and files, and at a critical decision gate it consults a higher-level Fable/Opus advisor node shown as a bright strategic brain or command tower. Show the advisor only connected at key decision points, not doing all execution. Dark navy #07090f background, teal workflow lines, amber decision gate, purple advisor glow. Optional short labels: "Sonnet Executor", "Fable/Opus Advisor", "关键判断". Clean, elegant, technical.

---

## 4. managed-agents.webp — Managed Agents 分工

Create a vertical 9:16 clean architecture diagram illustration. Gui Ge, based on the provided reference image, appears as a calm coordinator at a command console. A central Sonnet coordinator node at the top dispatches work to multiple smaller worker nodes: Research, Validate, Extract, Review. Each worker has its own isolated context bubble and tool icons. Show parallel lines, structured outputs returning to the coordinator. Dark mode aesthetic, deep navy background, teal coordinator lines, amber validation accents, purple review node. Optional Chinese title text: "横向分工：上下文隔离 + 并行吞吐". Keep layout readable on mobile.

---

## 5. plan-big-execute-small.webp — Plan Big Execute Small

Create a vertical 9:16 layered workflow illustration. Gui Ge, based on the provided reference image, stands beside a three-layer architecture board and points at the workflow. Top layer "Plan Big" with Sonnet/Fable/Opus planning and defining criteria; middle layer "Execute Small" with many cheaper worker nodes searching, reading, extracting, and validating; bottom layer "Review Hard" with synthesis, conflict checking, and final judgment. Use dark navy #07090f background, teal for planning and orchestration, amber for worker activity, purple for final review. Include short clear English labels: "Plan Big", "Execute Small", "Review Hard". Minimal elegant engineering diagram, high contrast, no clutter.

---

## 使用说明

1. 将上述 prompt 分别输入 AI 图片生成工具（如 Midjourney, DALL-E, Ideogram 等）
2. 建议使用 9:16 比例，分辨率至少 1080x1920
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）
4. 文章中已经用 `![描述](文件名.webp)` 格式引用了这些图片
