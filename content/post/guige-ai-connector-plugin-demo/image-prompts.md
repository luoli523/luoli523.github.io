# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 .webp 或 .png（会自动转为 .webp），文件名与文章中引用一致。

## 视觉方案

- Primary skill: `guige-svg`（正文六张图已就位：before-after、demo-runlog、ticket-response、ticket-skill-response、project-map、layers，均来自仓库 docs/images，无需再生成）
- Primary style/layout/aspect: 深色技术图，16:9
- Why: 文章讲的是代码仓库、终端、plugin 结构，深色技术风与正文截图和 SVG 一致
- Per-image overrides: cover.webp -> `guige-imagen` 或 `guige-infographic`，见下

---

## 1. cover.webp — 文章封面（含鬼哥形象）

Skill/style: `guige-imagen` / 深色扁平插画 / 16:9
Role: cover
Intent: 一眼看出"三个系统通过一个插头接到 AI 上"，鬼哥在旁边当讲解员
Reference: `~/.claude/skills/references/guige-character.png`（角色参考，保持发型、橙色"鬼哥"头带、蓝色连帽衫、半睁眼的淡定表情）

已用本机 Codex 的 image_generation 生成，2026-09-16。

深色背景（深蓝黑，接近 #0f172a），扁平矢量插画风，线条干净。画面左侧三个并排的小型系统图标：一张工单卡片、一张员工名牌、一本文档，紫色描边。三条线汇成一条，接到画面中央一个发光的青色插头，插头插进右侧一块代表 AI 助手的圆角面板，面板上一个对话气泡，气泡里写中文"帮我处理 T-1042"。画面右下角站着鬼哥：Q 版年轻男性，橙色头带上有"鬼哥"两个字，蓝色连帽衫，半睁着眼一脸淡定，一只手指着那个插头，像在讲解，不背吉他。角色高度不超过画面三分之一，不遮挡主体。画面左下角小字 "Connector + Skill + Plugin"。不要真人、不要品牌 logo、不要其他文字。构图留出上方约四分之一空间给标题叠字。

生成命令（在 ~/.guige-skills/.env 里配好 GOOGLE_API_KEY 或 OPENAI_API_KEY 后）：

```bash
python3 ~/.claude/skills/guige-imagen/scripts/main.py \
  --prompt "<上面这段 prompt>" \
  --ref ~/.claude/skills/references/guige-character.png \
  --provider google --ar 16:9 --image cover.png
```

出图在 `~/Downloads/guige-skill-imagen/`，复制到本目录命名为 cover.png 即可。

---

## 使用说明

1. 只需生成 cover.webp，其余六张已在目录中
2. 画幅 16:9
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）
