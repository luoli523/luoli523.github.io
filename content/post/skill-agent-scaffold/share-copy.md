# Distribution Copy

## 朋友圈（50-80 字）

最近把 agent-skills 拆了一遍。真正值得学的不是它有多少 Prompt，而是如何分开 Skill、Agent、编排、平台适配和验证。整理成一篇可直接照着搭项目骨架的文章。

## 公众号转发语（100-150 字）

如果团队已经开始积累 Skill 和 Agent，最容易遇到的问题不是“不会写 Prompt”，而是职责混杂、触发不稳、跨平台复制和无人验证。这篇文章以 agent-skills 为例，拆解从 Skill、Persona、并行编排到插件 manifest、evals 的完整脚手架，并给出最小目录、开发顺序与发布检查表，适合准备把个人工作流做成团队工程资产的人。

## 可摘录观点

1. Skill 是工艺，Agent 是工位，Orchestrator 是流水线。
2. 共享的是语义核心，复制的是薄适配层。
3. 脚手架的价值，不是更快地产生 Prompt，而是让团队可以像维护代码一样维护 Agent 的行为。
