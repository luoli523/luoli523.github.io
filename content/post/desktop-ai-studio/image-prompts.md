# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 .webp 或 .png（会自动转为 .webp），文件名与文章中引用一致。

说明：文章开头新增了三张鬼哥设备实拍图，已经放在本目录并转换为 WebP：

- `guige-4090-rig.webp`
- `guige-macmini.webp`
- `guige-raspberrypi.webp`

下面这些 prompt 只需要生成封面和技术示意图。

---

## 1. cover.webp — 文章封面

Three compact desktop AI workstations on a dark technical desk, represented as three distinct routes: NVIDIA CUDA route, AMD ROCm PC route, Apple Silicon macOS route. Center composition with subtle glowing circuit paths splitting into three lanes, one teal, one amber, one purple. Include small recognizable abstract cues only, no brand logos, no text overlay. Mood: serious, technical, premium, for AI developers and researchers.

Style: clean tech illustration, dark mode aesthetic, minimal and elegant. Background: deep dark navy (#07090f or #0d1117). Primary accent: teal (#2dd4bf), secondary accent amber (#f59e0b), tertiary accent purple (#a78bfa). 16:9 aspect ratio.

---

## 2. memory-wall.webp — 本地大模型的内存墙

An abstract diagram showing local LLM model sizes hitting a memory wall. Three vertical capacity gates labeled visually by size tiers: 64GB, 128GB, 200B model zone. Use stacked translucent blocks representing model weights, KV cache, context window, runtime overhead. The 64GB lane is constrained, the 128GB lane is more open. Text is allowed only for short labels: "64GB", "128GB", "KV Cache", "Model Weights".

Style: clean technical infographic, dark mode aesthetic, minimal and elegant. Background: deep dark navy (#07090f or #0d1117). Primary accent: teal (#2dd4bf), secondary accent amber (#f59e0b), warning accent red (#f87171). 16:9 aspect ratio.

---

## 3. software-stack.webp — 三套软件栈

A three-column software stack comparison illustration. Left column: CUDA / DGX OS stack with layered blocks from hardware to frameworks to deployment. Middle column: ROCm / Linux / Windows stack with flexible branching paths. Right column: MLX / Metal / macOS stack with polished integrated layers. No company logos. Short text labels are allowed: "CUDA", "ROCm", "MLX", "Linux", "macOS".

Style: clean tech diagram, dark mode aesthetic, minimal and elegant. Background: deep dark navy (#07090f or #0d1117). Use teal for NVIDIA/CUDA lane, amber for AMD/ROCm lane, purple for Apple/MLX lane. 16:9 aspect ratio.

---

## 4. workflow-map.webp — 不同 AI 工作流对应的最佳机器

A workflow map for AI developers showing five nodes: Local LLM Inference, Fine-tuning, ComfyUI / Image Generation, Robotics / Edge AI, Creative Development. Each node connects to one of three abstract desktop AI machines. The visual should show that different workflows route to different machines, not a single winner. Use icons: chat bubbles, tuning sliders, image canvas, robot arm, code editor. Text labels are allowed and should be short and legible.

Style: clean tech illustration, dark mode aesthetic, minimal and elegant. Background: deep dark navy (#07090f or #0d1117). Primary accent teal (#2dd4bf), secondary amber (#f59e0b), tertiary purple (#a78bfa). 16:9 aspect ratio.

---

## 5. decision-matrix.webp — 三类用户的选择矩阵

A decision matrix for three user personas: AI App Developer, Researcher, AI Geek. Rows are personas, columns are three abstract AI studio routes: CUDA Appliance, Open PC AI Box, macOS Creative Studio. Use check marks, warning markers, and strength bars. Keep the design readable, dashboard-like, not cluttered. Text is allowed for the persona labels and route labels.

Style: clean technical infographic, dark mode aesthetic, minimal and elegant. Background: deep dark navy (#07090f or #0d1117). Use teal, amber, purple, and subtle gray grid lines. 16:9 aspect ratio.

---

## 使用说明

1. 将上述 prompt 分别输入 AI 图片生成工具（如 Midjourney, DALL-E, Ideogram 等）
2. 建议使用 16:9 比例，分辨率至少 1920x1080
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）
4. 文章中已经用 `![描述](文件名.webp)` 格式引用了这些图片
