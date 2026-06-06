# 文章配图生成 Prompt

生成后将图片保存到本目录，格式为 .webp 或 .png（会自动转为 .webp），文件名与文章中引用一致。

统一风格：**dark mode aesthetic**, deep dark navy background `#07090f` or `#0d1117`, primary accent teal `#2dd4bf`, secondary amber `#f59e0b`, tertiary purple `#a78bfa` and red `#f87171`. Clean tech illustration, minimal and elegant, 16:9 aspect ratio (at least 1920x1080).

---

## 1. cover.webp — 文章封面

A clean dark-mode tech illustration showing the transition from a chaotic web of symlinks to a single elegant plugin package. On the left half: a tangled spiderweb of thin teal lines connecting scattered small "skill" cards labeled with command names like `/imagen`, `/svg`, `/blog-post`, `/picbook`, looking messy and fragile. On the right half: a single neat dark card labeled "guige plugin" containing a 3x3 grid of small skill icons in teal and amber, with a glowing teal arrow pointing toward it and a label `/plugin install`. A subtle dashed line down the middle separates the two halves. Title text at top reads "From install.sh to Plugin" in clean JetBrains Mono font, teal color. Background: deep dark navy #07090f with subtle grid texture. Style: minimal, elegant, clean tech illustration, dark mode aesthetic. 16:9 ratio.

---

## 2. symlink-vs-plugin.webp — symlink 蜘蛛网 vs plugin 单线对比

A side-by-side comparison diagram on a deep dark navy background. Left side labeled "install.sh era" in amber color — shows a developer machine icon in the center with multiple thin tangled lines (symlinks) reaching out to many scattered skill folders, each link labeled with a target path like `~/.claude/skills/`, `~/.codex/skills/`, `~/.anthropic/skills/`. The lines crisscross messily. A small red warning icon hovers above with text "breaks on new machine". Right side labeled "Plugin era" in teal — shows the same machine icon but now with a single clean teal arrow pointing to one neat package box labeled "guige plugin", with a small label below reading `/plugin install`. The package box contains a tidy grid of skill icons. A small green checkmark with text "one command, anywhere". A vertical dashed divider separates the two sides. Style: clean tech illustration, dark mode, minimal and elegant. 16:9 ratio.

---

## 3. directory-tree.webp — guige-skills 目录结构可视化

A clean dark-mode visualization of the guige-skills repository directory structure as an organized vertical tree on a deep navy background `#07090f`. Render it as a polished file-tree diagram with monospace JetBrains Mono font. The root folder `guige-skills/` at top. Below it, branches showing key directories with subtle teal connecting lines:

- `.claude-plugin/` (highlighted with a teal glow border) containing `plugin.json` and `marketplace.json`
- `.codex-plugin/` (subtle amber glow) containing `plugin.json`
- `.agents/plugins/` (subtle purple glow) containing `marketplace.json`
- `hooks/` (highlighted with teal glow) containing `hooks.json` and `session-start.sh`
- `skills/` (largest section, with teal accent) showing one expanded child `guige-svg/` with sub-items `SKILL.md`, `scripts/`, `agents/`, `references/`
- `install.sh` with a small grey "legacy" tag
- `CLAUDE.md`

Each folder icon is a small minimal outline. The plugin-related folders (`.claude-plugin/`, `.codex-plugin/`, `.agents/`, `hooks/`, `skills/`) are visually emphasized with stronger teal accents while supporting files are dimmer. Style: clean, minimal, dark mode tech illustration, looks like a polished dev tool screenshot. 16:9 ratio.

---

## 4. extensions-map.webp — Hooks / Agents / Commands 三大扩展点关系图

A clean dark-mode conceptual diagram on background `#07090f` showing three pillars of plugin extension points. In the center, a dark hexagonal card labeled "Plugin" with subtle teal border glow. Three branches radiate outward to three labeled cards at equal angles:

- Top: "Hooks" card in teal `#2dd4bf`, with small icon of a hook/lifecycle wheel, subtitle "lifecycle callbacks (SessionStart, PreToolUse, ...)"
- Bottom-left: "Agents" card in purple `#a78bfa`, with small icon of branching nodes, subtitle "skill-internal sub-agents (YAML specs)"
- Bottom-right: "Commands" card in amber `#f59e0b`, with small icon of a slash `/`, subtitle "slash command triggers (/imagen, /svg, ...)"

Each connection line from center to outer card is a thin glowing teal arc. Add a subtle footer label "more in the next post →" in dim text bottom-right. Style: minimal, elegant, dark mode tech illustration, clean geometric shapes. 16:9 ratio.

---

## 5. migration-steps.webp — 5 步迁移流程图

A clean dark-mode horizontal flow diagram on background `#07090f` showing 5 numbered steps for migrating from scattered skills to a plugin. Five rectangular cards arranged left-to-right, connected by thin teal arrows. Each card has a large step number in JetBrains Mono and a short label:

1. `01` — "mkdir" — sub-label "create plugin dirs"
2. `02` — "plugin.json" — sub-label "write minimal manifest"
3. `03` — "SKILL.md" — sub-label "polish descriptions"
4. `04` — "marketplace.json" — sub-label "repo becomes marketplace"
5. `05` — "hooks + CI" — sub-label "optional but recommended"

Steps 1-4 are highlighted with teal accent borders, step 5 has an amber accent (optional). Below the row of cards, a thin horizontal timeline shows elapsed effort: "~30 minutes total" in dim teal text. The leftmost step has a small label "start" and the rightmost has a "/plugin install" badge in teal. Style: minimal, elegant, clean tech illustration, dark mode aesthetic, looks like a polished product roadmap. 16:9 ratio.

---

## 使用说明

1. 将上述 prompt 分别输入 AI 图片生成工具（如 Midjourney, DALL-E, Ideogram, Imagen 等）
2. 使用 16:9 比例，分辨率至少 1920x1080
3. 生成后保存到本目录（PNG 或 WebP 均可，后续会统一转为 WebP）
4. 文件名必须与文章中引用一致：`cover.webp`、`symlink-vs-plugin.webp`、`directory-tree.webp`、`extensions-map.webp`、`migration-steps.webp`
