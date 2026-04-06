# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 .webp，文件名与文章中引用一致。

---

## 1. cover.webp — 文章封面

```
A dark, futuristic digital illustration of a glowing knowledge network. In the center, a luminous brain-shaped node connects to dozens of floating markdown document icons through neon teal lines. The documents are organized in a structured tree pattern, not chaotic. The background is deep navy (#07090f) with subtle grid lines. Style: clean tech illustration, dark mode aesthetic, teal (#2dd4bf) as primary accent color, minimal and elegant. No text. 16:9 aspect ratio.
```

---

## 2. memex-evolution.webp — Memex 到 LLM Wiki 的演化

```
A horizontal timeline illustration showing the evolution from Memex to LLM Wiki. Left side: a 1940s-style mechanical desk device (Vannevar Bush's Memex) with microfilm reels, drawn in sepia/vintage style. Middle: a web browser with hyperlinks, drawn in early-2000s flat style. Right side: a modern dark-mode terminal/IDE with interconnected markdown files and a glowing AI assistant icon. The three eras are connected by flowing arrows. Labels below: "1945 Memex", "1989 World Wide Web", "2026 LLM Wiki". Background: gradient from warm sepia (left) to cool dark navy (right). Style: conceptual tech illustration, clean lines, minimal. 16:9 aspect ratio.
```

---

## 3. rag-vs-wiki.webp — RAG vs LLM Wiki 对比

```
A split-screen comparison diagram on dark background. LEFT side labeled "RAG": shows a cycle of scattered document chunks flowing into a vector database, then to an LLM, producing an answer that disappears (fading out). The flow is circular and repetitive, with dimmer colors. RIGHT side labeled "LLM Wiki": shows raw documents flowing through an LLM into a structured wiki (interconnected markdown pages with visible links between them), with answers flowing back into the wiki, creating a growing spiral. The wiki side glows brighter with teal accent, showing accumulation. A clear dividing line between the two sides. Style: clean technical diagram, dark mode, teal (#2dd4bf) and amber (#f59e0b) accents. No realistic elements, pure diagrammatic. 16:9 aspect ratio.
```

---

## 4. human-ai-division.webp — 人与 AI 的分工

```
A conceptual illustration showing the division of labor between human and AI in knowledge management. Top half (warm-toned, amber accent): a human silhouette icon surrounded by thought bubbles containing question marks, lightbulbs, and magnifying glasses — representing curation, questioning, and insight. Bottom half (cool-toned, teal accent): an AI/robot icon surrounded by interconnected document nodes, cross-reference arrows, index files, and checkmarks — representing bookkeeping, indexing, cross-referencing, and maintenance. A horizontal dividing line between them with bidirectional arrows showing collaboration. Dark background (#0d1117). Style: minimal flat illustration, icon-based, dark mode aesthetic. 16:9 aspect ratio.
```

---

## 5. workflow-overview.webp — 完整工作流总览

```
A comprehensive workflow diagram on dark background showing the complete LLM Wiki pipeline. Flow from left to right: (1) "Raw Sources" box with icons for articles, papers, images, datasets → (2) "LLM Compiler" represented as a glowing processing node → (3) "Wiki" shown as an organized collection of interconnected markdown files with visible cross-links → (4) Three output branches: "Query" (magnifying glass icon), "Lint" (health check icon), "Output" (slides, charts, reports icons). Arrows loop back from Query and Lint outputs into the Wiki, showing the feedback loop. Below the main flow: "Obsidian" as the viewing layer spanning the entire width, and "Git" as the version control layer at the very bottom. Colors: teal primary, amber secondary, dark navy background. Style: clean system architecture diagram, modern tech aesthetic, minimal. 16:9 aspect ratio.
```

---

## 使用说明

1. 将上述 prompt 分别输入你常用的 AI 图片生成工具（如 Midjourney, DALL-E, Ideogram 等）
2. 建议使用 16:9 比例，分辨率至少 1920x1080
3. 生成后转换为 .webp 格式，保存到本目录
4. 文章中已经用 `![描述](文件名.webp)` 格式引用了这些图片，无需修改文章
