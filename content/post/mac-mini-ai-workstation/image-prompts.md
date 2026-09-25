# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 .webp 或 .png（会自动转为 .webp），文件名与文章中引用一致。

已就绪（来自本机 Qwen-Image-2.1 实际生成，已转 WebP）：

- `qwen-neon-sign.webp`、`qwen-beijing-diorama.webp`、`qwen-sketchbook.webp`、`qwen-fake-signature.webp`

需要鬼哥本人提供的照片和截图见 `screenshots.md`。

## 视觉方案

- Primary skill: `guige-svg`
- Primary style/layout/aspect: 浅色主题、暖色点缀，16:9 横图
- Why: 文章是一篇有温度的桌面实践，核心的两张解释图（工作站组成、内存接力）需要准确、可读的标签，SVG 最合适；封面需要氛围感，改用插画。
- Per-image overrides: `cover.webp` -> `guige-imagen` / 温暖的编辑插画 / 16:9。可以考虑直接用这台 Mac mini 上的 Qwen-Image-2.1 生成，正好让工作站给自己画封面。

---

## 1. cover.webp — 文章封面（✅ 已由本机 Qwen-Image-2.1 生成，1344×768，seed 20260925，25 步，470 秒）

Skill/style: `guige-imagen` / warm editorial illustration / 16:9
Role: cover
Intent: 一台小小的 Mac mini 同时承载"写故事"和"画画"两件事，两者轮流上场。

A warm editorial illustration on a wooden desk at night, lit by a single warm desk lamp. In the center sits a small silver Mac mini (a flat square aluminum box, about 20 cm wide), glowing softly. Above it, two translucent spirits take turns on a small stage made of light: on the left, a scholar-like figure made of flowing Chinese calligraphy and lantern light, holding a brush and a scroll with faint text; on the right, a painter figure made of brush strokes and color splashes, holding a palette, stepping forward as the scholar gently steps back into shadow. Between them a thin glowing ribbon labeled "32G" forms the single stage they share. Background: a window with a soft rainy city night and a few Lantern Festival lanterns. Palette: warm amber, cream, soft teal accents; cozy, calm, slightly whimsical. No logos, no brand text, no watermark, no extra letters except the label "32G".

---

## 2. workstation-architecture.webp — 私人 AI 工作站的组成

Skill/style: `guige-svg` / flowchart, light theme / 16:9
Role: architecture
Intent: 让读者一眼看清一次"聊着天出张图"的完整流程，以及每个组件的内存占用。

从左到右的流程图，放在一个大框「M6 Mac mini · 32G 统一内存」里：

1. 「你」（浏览器 / Tailscale 设备）→ 箭头标注「中文描述画面」
2. 「Open WebUI」（:8080）
3. 分两条支路：
   - 上路：「Ollama · Qwen3.8-27B MLX」标注「约 18G」，箭头回到 Open WebUI，标注「① 写英文提示词」
   - 下路：「ComfyUI」（:8188）→「Qwen-Image-2.1 int8」标注「约 17G」，箭头标注「② 生图，约 4 分钟」
4. 从 ComfyUI 画一条虚线指向 Ollama，标注「接到任务：先让 Ollama 卸载模型」
5. ComfyUI 下方一个小标签「出图 5 秒后：/free 释放内存」
6. 图片回到 Open WebUI，标注「③ 图片回到对话」

底部一行说明文字：「同一时刻，内存里只留一个大模型」

配色：浅米白底，Ollama 用青色 #2dd4bf，ComfyUI 用琥珀色 #f59e0b，箭头用深灰；中文字体 Noto Serif SC，端口号和文件名用 JetBrains Mono。

---

## 3. memory-relay.webp — 一次生图的内存接力

Skill/style: `guige-svg` / timeline（堆叠面积图）, light theme / 16:9
Role: comparison / timeline
Intent: 用最后一次实测的时间线，展示两个模型如何轮流使用 32G 内存。

横轴是时间（约 5 分钟），纵轴是内存（0–32G），顶部画一条虚线标注「32G 统一内存」。按实测数据分段：

- 01:15 之前：青色块「Qwen3.8 写提示词 · 约 18G」
- 01:15:19：竖线标注「ComfyUI 接到任务 → 卸载 Qwen3.8」，青色块消失
- 01:15:30 – 01:19:10：琥珀色块「Qwen-Image-2.1 生图 · 25 步 × 约 8 秒」
- 01:19:10：竖线标注「出图」；琥珀色块在 5 秒内消失，标注「/free 释放」
- 01:19:15 之后：青色块重新出现「Qwen3.8 回来写回复」

底部单独画一条细折线「swap 已用」：一直在 3.8G 左右，01:19:22 有一个小尖峰到 7.5G，旁边标注「两者短暂重叠约 5 秒」。

右上角一个小对比框：「调整前：生图开头 swap 峰值 15.5G → 调整后：4.0G」

配色同上：青色 = Ollama，琥珀色 = ComfyUI，swap 折线用柔和的红色 #f87171。

---

## 使用说明

1. 封面用 guige-imagen 或本机 Qwen-Image-2.1 生成（16:9，比如 1664×928）；两张解释图用 guige-svg 直接绘制并导出 PNG
2. 默认使用 9:16 竖图；如果 prompt 中指定 16:9、1:1 或 SVG，则按 prompt 的画幅执行
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）
4. 文章中已经用 `![描述](文件名.webp)` 格式引用了这些图片
