# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Development Commands

```bash
# Build site (production, minified)
hugo --minify

# Local development server with live reload
hugo server

# Build with drafts visible
hugo server -D
```

Hugo version required: **0.158.0 extended** (install via `brew install hugo` or `brew upgrade hugo`).

## Deployment

Pushing to `master` triggers GitHub Actions (`.github/workflows/deploy.yml`) which:
1. Detects newly added `content/post/*/index.md` files and auto-runs `python3 scripts/update_announcements.py <post_path>` to prepend an entry to `data/announcements.yaml`, then commits with `feat: 新文章公告更新 [skip ci]`
2. Builds with `hugo --minify`
3. Deploys to GitHub Pages

## Architecture

### Homepage vs Inner Pages

The site has a **split rendering model**:

- **Homepage** (`layouts/index.html`): A fully self-contained, 1700+ line custom HTML/CSS/JS file. It does not use the Stack theme's templates at all. It has its own dark/light toggle (stored as `gg-theme` in localStorage), glassmorphism design, and all CSS inlined. Edit this file directly for any homepage changes.

- **Inner pages** (`/post/`, `/page/`, etc.): Rendered by the Stack theme (`themes/hugo-theme-stack/`). Customized via:
  - `assets/scss/custom.scss` — overrides all Stack CSS variables to match the homepage's "Ghost Protocol" dark palette (bg `#07090f`, cards `#0f151e`, teal accent `#2dd4bf`)
  - `layouts/partials/head/custom-font.html` — replaces Stack's default Lato with Noto Serif SC + JetBrains Mono
  - `config/_default/params.toml` — forces dark mode (`colorScheme.toggle = false, default = "dark"`)

### Key Files

| File | Purpose |
|---|---|
| `layouts/index.html` | Entire custom homepage (HTML + CSS + JS, self-contained) |
| `assets/scss/custom.scss` | Stack theme overrides for inner pages |
| `data/announcements.yaml` | Drives the floating announcement panel on the homepage |
| `scripts/update_announcements.py` | Prepends a new entry to `announcements.yaml` from a post's front matter |
| `config/_default/params.toml` | Waline comments config, sidebar, widgets, color scheme |
| `config/_default/hugo.toml` | Base URL, language, theme, pagination, URL structure |
| `config/_default/markup.toml` | LaTeX math passthrough, code highlighting settings |

### Content Structure

- `content/post/*/index.md` — blog posts (section = `post`, URL = `/p/:slug/`)
- `content/page/*/index.md` — static pages (about, books, archives, search)

### Announcements Panel

`data/announcements.yaml` entries use these fields:
```yaml
- date: "MM-DD"
  color: teal|amber|purple|red
  type: book|tool|life|note
  tag: "显示标签"
  text: "HTML allowed description"
```
Category → color mapping in `scripts/update_announcements.py`: AI/LLM → teal, 工具 → amber, 生活 → red, default → purple.

### Theme Submodule

`themes/hugo-theme-stack` is a git submodule (branch: master). Always checkout with `git submodule update --init --recursive`.

### Homepage Design System (CSS variables in `layouts/index.html`)

```
--bg-void: #07090f       (deepest bg)
--bg-surface: #0d1117
--bg-card: #0f151e
--teal: #2dd4bf          (primary accent)
--amber: #f59e0b         (secondary, used for fin-report / projects)
--purple: #a78bfa
--red: #f87171
--text-primary: #e8eaf0
--text-secondary: #8b9ab0
```

Fonts: `Noto Serif SC` (serif body/headings) + `JetBrains Mono` (mono/UI labels).

## Important Rules

1. Before writing any code, describe your approach and wait for approval.
2. If the requirements I give you are ambiguous, ask clarifying questions before writing any code.
3. After you finish writing any code, list the edge cases and suggest test cases to cover them.
4. If a task requires changes to more than 3 files, stop and break it into smaller tasks first.
5. When there's a bug, start by writing a test that reproduces it, then fix it until the test passes.
6. Every time I correct you, reflect on what you did wrong and come up with a plan to never make the same mistake again.
