# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 .webp 或 .png（会自动转为 .webp），文件名与文章中引用一致。

**整体视觉风格**：博客 Ghost Protocol 暗色系——深色 navy 背景（`#07090f` / `#0d1117`），主色青绿 teal（`#2dd4bf`），辅色琥珀 amber（`#f59e0b`）、紫 `#a78bfa`、红 `#f87171`。整体感受："clean tech illustration, dark mode aesthetic, minimal and elegant, futuristic but not gimmicky"。所有图都按 16:9 比例。

---

## 1. cover.webp — 文章封面

A clean, minimal tech illustration on a deep dark navy background (#07090f). On the left side, a flowing audio waveform rendered in glowing teal (#2dd4bf) lines, smooth and organic. On the right side, the waveform transforms into rows of crisp text lines (abstract typography, not real words) glowing softly in amber (#f59e0b). A subtle vertical "transformation gradient" connects the waveform to the text. Floating in the background, very faint hints of multiple language scripts (Chinese characters, English letters, Japanese kana, Korean hangul, Arabic) at low opacity to suggest multilingual capability. Style: clean tech illustration, dark mode aesthetic, minimal and elegant, futuristic but not gimmicky. No text overlay, no watermarks. 16:9 aspect ratio.

---

## 2. what-is-turbo.webp — Whisper Turbo 概念图

A minimalist tech infographic on deep dark navy background (#07090f). Center: a stylized abstract "engine" or "core" rendered in glowing teal (#2dd4bf), looking efficient and compact (think: a small but powerful machine). Around the core, three orbital rings each carrying small glowing icons representing the three outputs: (1) a transcript text icon, (2) a translation/globe icon, (3) a clock/timestamp icon — each in a different accent color (teal, amber, purple). In the background, faint floating language script fragments (CN/EN/JP/KO/AR/FR/DE) at low opacity, suggesting "99 languages". A subtle "8x" or speed indicator visual element (like motion lines) in amber to hint at the Turbo speedup. Style: clean tech illustration, dark mode, minimal, no actual readable text labels needed. 16:9 aspect ratio.

---

## 3. use-cases.webp — 应用场景拼贴

A clean grid-style illustration on dark navy background (#07090f), divided into 4 minimal scene icons (2x2 grid layout) each glowing softly. Top-left: a microphone with sound waves (representing podcast/recording). Top-right: a meeting room silhouette with multiple speech bubbles (representing meetings). Bottom-left: a video player frame with subtitle bars at the bottom (representing video subtitling). Bottom-right: a notebook/document with audio waveform on the side (representing voice notes / transcripts). Each scene rendered in line-art style with one accent color: teal, amber, purple, and red respectively. Background is uniformly dark, scenes connected by very subtle thin lines suggesting they're all part of the same ecosystem. Minimal, clean, no text labels. 16:9 aspect ratio.

---

## 4. online-demo.webp — 在线 demo 操作示意

A clean illustration of a stylized browser window on dark navy background (#07090f). The browser frame is rendered in subtle gray outlines. Inside the browser window: an upload zone in the center with a glowing teal (#2dd4bf) dashed border, an audio waveform visualization just below it, and a few abstract "result" text bars appearing on the right side in amber (#f59e0b). A subtle WebGPU/lightning bolt icon in the corner hinting at GPU acceleration. The overall feel: "drag, drop, done" — emphasizing simplicity and zero-config. Style: minimal flat tech illustration, dark mode, no real readable text. 16:9 aspect ratio.

---

## 5. local-setup.webp — 本地部署代码视觉

A minimalist illustration on deep dark navy background (#07090f). Center-left: a stylized terminal / code editor window with a few lines of glowing code (abstract Python-like syntax, no need for real readable text — just suggest code structure with teal keywords and amber strings). Center-right: an audio file icon with a small waveform, connected by a glowing teal arrow flowing into the code window, then a second arrow flowing out to a structured text output (formatted lines with timestamp-like prefixes in amber). The whole flow reads left-to-right: "audio → code → transcript". Style: clean tech illustration, dark mode, minimal, slightly schematic / technical-diagram feel. 16:9 aspect ratio.

---

## 使用说明

1. 将上述 prompt 分别输入 AI 图片生成工具（如 Midjourney, DALL-E, Ideogram, Nano Banana 等）
2. 建议使用 16:9 比例，分辨率至少 1920x1080
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）
4. 文章中已经用 `![描述](文件名.webp)` 格式引用了这些图片
