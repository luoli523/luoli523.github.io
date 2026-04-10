# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 .webp 或 .png（会自动转为 .webp），文件名与文章中引用一致。

---

## 1. cover.webp — 文章封面

A clean tech illustration on deep dark navy background (#07090f). Center: a minimalist chat bubble icon with a friendly robot face inside (simple dot eyes and curved smile line), glowing with teal (#2dd4bf) neon edges. Around it, faint concentric rings of teal light pulse outward. To the left, tiny floating YAML code fragments in muted text. To the right, small JavaScript bracket symbols { } fading into the dark. Bottom: a subtle grid of dots suggesting a digital foundation. The overall feeling is approachable, minimal, and modern — "building something simple but magical." No text. 16:9 aspect ratio.

---

## 2. guige-page.webp — 博客首页截图

这张图从之前的文章 managed-agents-intro 目录复制过来即可，不需要重新生成。

```bash
cp content/post/managed-agents-intro/guige-page.webp content/post/diy-ai-avatar/guige-page.webp
```

---

## 使用说明

1. 将上述 prompt 分别输入 AI 图片生成工具（如 Midjourney, DALL-E, Ideogram 等）
2. 建议使用 16:9 比例，分辨率至少 1920x1080
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）
4. 文章中已经用 `![描述](文件名.webp)` 格式引用了这些图片
