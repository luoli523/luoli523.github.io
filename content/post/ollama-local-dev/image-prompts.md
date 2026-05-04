# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 .webp 或 .png（会自动转为 .webp），文件名与文章中引用一致。

---

## 1. cover.webp — 文章封面

A powerful local AI developer workstation with a high-end NVIDIA GPU glowing inside a clean desktop PC, terminal windows showing local model inference, subtle Ollama-inspired model server concept, dark navy background #07090f, teal accent #2dd4bf, amber data highlights, clean tech illustration, minimal and elegant, premium engineering blog cover, no logos, no brand names, no readable UI text. No text. 16:9 aspect ratio.

---

## 2. ollama-stack.webp — Ollama 本地模型网关

A clean architecture diagram style illustration: developer tools, scripts, and AI agents connected to a local model gateway on localhost, then connected to a GPU-powered Gemma model node. Dark mode aesthetic, deep navy background #07090f, teal connection lines #2dd4bf, amber metric nodes #f59e0b, minimal elegant tech diagram, readable structure but no text labels, no logos. No text. 16:9 aspect ratio.

---

## 3. codex-claude-hermes.webp — 三个开发工具接入本地模型

Three terminal panels representing coding agent workflows connected to one local Ollama inference engine, one panel successful, one panel with a sandbox warning visual, one panel with an agent workflow graph. Dark mode UI aesthetic, clean tech illustration, teal primary accent, amber warning accent, purple secondary nodes, no real product logos, no readable text. No text. 16:9 aspect ratio.

---

## 4. benchmark-dashboard.webp — 本地推理性能仪表盘

A dark technical benchmark dashboard visualizing local LLM inference performance: tokens per second, GPU memory, power draw, temperature, utilization charts, RTX workstation feel, deep dark navy background, teal graphs, amber highlights, crisp grid lines, minimal elegant data visualization, no readable numbers or labels. No text. 16:9 aspect ratio.

---

## 5. local-ai-boundary.webp — 本地模型能力边界

A balanced comparison illustration showing local AI model strengths and limits: private code, scripts, test generation on one side; complex refactoring, multi-repo planning, high-risk production changes on the other. Use abstract panels, check and caution symbols, dark navy background, teal for suitable tasks, amber and red for caution zones, clean tech illustration, no readable text. No text. 16:9 aspect ratio.

---

## 使用说明

1. 将上述 prompt 分别输入 AI 图片生成工具（如 Midjourney, DALL-E, Ideogram 等）
2. 建议使用 16:9 比例，分辨率至少 1920x1080
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）
4. 文章中已经用 `![描述](文件名.webp)` 格式引用了这些图片

---

## 真实截图（不要用 AI 生成）

下面这些图片需要按 `screenshots.md` 手动截取真实终端/监控画面：

- `btop-inference.webp`
- `nvidia-smi-dmon.webp`
- `claude-code-local.webp`
- `codex-local.webp`
- `hermes-local.webp`

这些截图用于补充文章里的真实性能监控和工具链运行证据。
