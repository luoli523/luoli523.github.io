# 文章配图生成说明

## 视觉方案

- Primary skill: `guige-hand-write-pic`
- Style: `lab-notes × hand-drawn-edu`
- Layout/aspect: 封面使用 Bento 叙事构图，正文图使用技术架构图与并行流程图，均为 16:9
- Palette: 暖奶油纸张、黑色手写线条、粉彩蓝/薄荷绿/淡紫/浅桃色分区，青绿与珊瑚橙强调
- Character reference: `~/Downloads/guige.png`；仅复用橙色“鬼哥”头巾、棕发、大眼睛与蓝灰连帽衫，不复用原图的咖啡馆、电脑品牌、饮品或黑色矩形
- Why: 文章既要解释工程结构，也要保留个人作者形象；实验室手记比冷硬工程图更有亲和力，同时仍能准确表达层级和数据流。

完整分析、结构化内容与可复用 prompt 位于：

`hand-write-pic/skill-agent-scaffold-redesign/`

---

## 图片清单

### 1. cover.webp — 文章封面

- 标题：Skill + Agents 项目脚手架
- 副标题：从 Prompt 集合到工程资产
- 核心叙事：零散 Prompt 卡片依次进入 Skill、Agent、Orchestrator、Manifest + Evals，最终装进工程工具箱
- 人物位置：左侧，约占画面 24%

### 2. skill-agent-layers.webp — 三个区域

- 语义核心：Skill、Agent、References
- 调用与适配：Orchestrator、Claude Code、Codex、Gemini
- 工程保障：Manifest、Lint + Link Check、Evals + Smoke Test
- 关键结论：共享语义核心，复制薄适配层

### 3. ship-fanout.webp — /ship 并行编排

- 输入：同一份 diff + 验收标准
- 并行专家：code-reviewer、security-auditor、test-engineer
- 汇合：主 Agent 去重、交叉验证、定级
- 输出：GO + 回滚计划，或 NO-GO + 阻断项
- 约束：独立上下文、不互相调用、无共享可变状态

---

## 输出约束

1. 图片为 16:9 横图，发布版本统一为 1920×1080 WebP
2. 中文必须清晰，禁止伪文字和无意义装饰标签
3. 文章引用文件名固定为 `cover.webp`、`skill-agent-layers.webp`、`ship-fanout.webp`
4. 生成原图保留在 Codex generated images 目录，博客目录仅保存发布所需 WebP
