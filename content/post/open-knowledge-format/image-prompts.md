# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 .webp 或 .png（会自动转为 .webp），文件名与文章中引用一致。

整体视觉风格：深色科技感，背景使用 deep dark navy `#07090f` 或 `#0d1117`，主强调色 teal `#2dd4bf`，辅色 amber `#f59e0b`，少量 purple `#a78bfa` 和 red `#f87171`。风格关键词：clean tech illustration, dark mode aesthetic, minimal and elegant, data infrastructure, knowledge graph, agent context engineering。默认 9:16 竖版，适合博客封面和公众号头图。

---

## 1. cover.webp — 文章封面

一位 AI Agent 站在巨大的知识档案库入口前，档案库由 Markdown 文件、YAML frontmatter、目录树、知识图谱节点和 Git commit 线索组成。画面中心表达“AI Agent 缺的不是模型，是可交接的上下文”。深色背景 `#07090f`，teal 光线连接文件节点，amber 高亮关键上下文。允许少量清晰文字，文字仅为：“Open Knowledge Format”。clean tech illustration, dark mode aesthetic, minimal and elegant, cinematic lighting, high detail, 9:16.

---

## 2. context-map.webp — OKF 把散落的企业知识整理成 AI Agent 可读取的上下文地图

左侧是散落的企业知识碎片：数据表、指标定义、runbook、API 文档、代码注释、资深工程师脑中的想法气泡；右侧是一个 AI Agent 正在读取整理后的上下文地图，地图由 Markdown 文件卡片和链接线组成。中间有一个转换通道标记“OKF”。深色科技风，teal 连接线，amber 高亮被整理后的知识节点，9:16.

---

## 3. okf-structure.webp — OKF bundle 的目录、frontmatter、markdown 链接三层结构

一张清晰的技术结构图，展示 OKF 的三层结构：底层是 directory tree，中层是 YAML frontmatter cards，上层是 Markdown links forming graph。画面中包含 `sales/`, `tables/orders.md`, `metrics/weekly_active_users.md`, `type`, `title`, `tags` 等少量可读文字。深色背景，teal 轮廓线，amber 标记关键字段，minimal elegant technical diagram, 9:16.

---

## 4. rag-vs-okf.webp — RAG chunk 与 OKF concept 的差异对比

左右对比构图。左侧标题“RAG chunks”，显示许多零散文本切片进入向量索引；右侧标题“OKF concepts”，显示一个个有标题、有 frontmatter、有链接关系的概念文件组成知识图谱。中间用一条分隔线和简短箭头对比“query-time retrieval” vs “curated concept graph”。深色科技风，高可读性，teal 和 amber 对比，9:16.

---

## 5. okf-roadmap.webp — OKF 从 v0.1 走向企业知识交换标准的演进路线

一条从左下到右上的演进路线图：v0.1 spec、reference agent、static visualizer、sample bundles、catalog ingest、enterprise adoption、open ecosystem。路径两侧有 Git commit、PR review、agent reader、knowledge catalog 等小图标。整体表达“format, not platform”。深色背景，teal 主路径，amber 里程碑节点，少量 purple 表示生态扩展，9:16.

---

## 6. platform-semantics.webp — Databricks Genie 和 Snowflake Cortex 各自强大，但 OKF 让业务语义有机会跨平台复用

左右两座大型企业数据平台高塔，左侧标记“Databricks Genie”，右侧标记“Snowflake Cortex”，每座塔内部都有自己的 semantic layer、metrics、verified queries、business terms。中间是一座开放桥梁，标记“OKF bundle”，由 Markdown 文件、YAML frontmatter、Git commits 和知识图谱线条组成，连接两边的业务语义。画面表达“top platforms, separate semantics, shared knowledge format”。深色科技风，teal 连接线，amber 高亮业务知识资产，minimal elegant enterprise architecture diagram, 9:16.

---

## 使用说明

1. 将上述 prompt 分别输入 AI 图片生成工具（如 Midjourney, DALL-E, Ideogram 等）
2. 建议使用 9:16 比例，分辨率至少 1080x1920
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）
4. 文章中已经用 `![描述](文件名.webp)` 格式引用了这些图片
