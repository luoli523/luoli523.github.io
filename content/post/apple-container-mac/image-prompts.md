# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 .webp 或 .png（会自动转为 .webp），文件名与文章中引用一致。

---

## 1. cover.webp — 文章封面

9:16 vertical cover, clean tech illustration, dark mode aesthetic. A sleek Apple Silicon MacBook on a deep navy background #07090f, with lightweight container cubes floating above the keyboard and a subtle Docker whale silhouette fading into the background as context, not dominant. Teal #2dd4bf as primary glow, amber #f59e0b as small highlights, minimal and elegant. Add short legible Chinese title text: "苹果 Container". Professional blog cover, sharp edges, no clutter.

---

## 2. ai-coding-container-load.webp — AI Coding 让本地容器负载变复杂

9:16 vertical clean tech illustration, dark mode #07090f. Show a Mac developer workstation running multiple AI coding agents as small terminal panes, connected to containers labeled "Agent", "Vector DB", "Sandbox", "Queue", "API". Use teal lines for active workflows, amber warning chips for load spikes. Minimal elegant composition, high contrast, readable tiny labels only where useful.

---

## 3. one-container-one-vm.webp — 每个容器一个轻量虚拟机的架构

9:16 vertical architecture diagram style, dark navy background #07090f. Visualize three separate lightweight VM capsules, each containing one container cube, all connected to macOS system layers: Virtualization, vmnet, XPC, launchd. Use teal #2dd4bf for VM boundaries, purple #a78bfa for macOS integration layer, amber #f59e0b for OCI image flow. Clean, precise, minimal text.

---

## 4. container-isolation-boundary.webp — 容器隔离边界从共享 VM 变清晰

9:16 vertical comparison image, split composition. Left side: one large shared VM box containing tangled containers and messy network lines, slightly muted. Right side: separate lightweight VM boxes with clear boundaries and simple paths. Dark mode aesthetic, teal highlights on the clean side, subtle red #f87171 on the messy side. Add short labels: "共享 VM" and "轻量 VM / 容器".

---

## 5. docker-vs-apple-container.webp — Docker Desktop 与 Apple container 的选择矩阵

9:16 vertical decision matrix illustration, dark background #07090f. A polished 2x2 matrix comparing "生态完整", "轻量", "团队协作", "Mac-native". Docker Desktop represented by a mature toolbench icon, Apple container by a lightweight system-chip container icon. Teal and amber accents, crisp UI-like grid, minimal readable Chinese labels, elegant technical blog style.

---

## 使用说明

1. 将上述 prompt 分别输入 AI 图片生成工具（如 Midjourney, DALL-E, Ideogram 等）
2. 建议使用 9:16 比例，分辨率至少 1080x1920
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）
4. 文章中已经用 `![描述](文件名.webp)` 格式引用了这些图片
