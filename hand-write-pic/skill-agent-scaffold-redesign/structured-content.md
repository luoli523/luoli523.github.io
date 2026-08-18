# Structured Content

## 1. cover.webp

- Title: Skill + Agents 项目脚手架
- Subtitle: 从 Prompt 集合到工程资产
- Modules: Skill / Agent / Orchestrator / Manifest + Evals
- Character: 鬼哥拿马克笔，在奶油色工程笔记纸上组装彩色模块
- Footer: 像维护代码一样维护 Agent 行为

## 2. skill-agent-layers.webp

- Title: 一套脚手架，三个区域
- 语义核心：Skill 怎么做 / Agent 谁来做 / References 共享标准
- 调用与适配：Orchestrator / Claude Code / Codex / Gemini
- 工程保障：Manifest / Lint + Link Check / Evals + Smoke Test
- Connector labels: 工作流 / 专业视角 / 打包 / 校验
- Rule strip: 共享语义核心，复制薄适配层
- Character: 鬼哥站在左下角用教鞭指向三大区域

## 3. ship-fanout.webp

- Title: /ship：三个专家并行，一位主 Agent 决策
- Input: 同一份 diff + 验收标准
- Parallel agents:
  - code-reviewer：正确性 / 架构 / 性能
  - security-auditor：威胁 / 权限 / 依赖
  - test-engineer：覆盖 / 边界 / 失败路径
- Merge: 主 Agent 去重 / 交叉验证 / 定级
- Outcomes: GO + 回滚计划 / NO-GO + 阻断项
- Rule strip: 独立上下文 · 不互相调用 · 无共享可变状态
- Character: 鬼哥坐在合并控制台前，三个小助手仅以职业图标表示
