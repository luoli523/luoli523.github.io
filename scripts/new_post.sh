#!/usr/bin/env bash
#
# 创建新 Hugo 文章骨架
# 用法:
#   交互模式:  ./scripts/new_post.sh
#   参数模式:  ./scripts/new_post.sh --title "标题" --slug "url-slug" --desc "描述" --cat "AI" --tags "tag1,tag2"
#

set -euo pipefail

CONTENT_DIR="$(cd "$(dirname "$0")/.." && pwd)/content/post"

# ---------- 默认值 ----------
TITLE=""
SLUG=""
DESC=""
CATEGORY=""
TAGS=""
DATE="$(date +%Y-%m-%d)"

# ---------- 解析命令行参数 ----------
while [[ $# -gt 0 ]]; do
    case "$1" in
        --title)  TITLE="$2";    shift 2 ;;
        --slug)   SLUG="$2";     shift 2 ;;
        --desc)   DESC="$2";     shift 2 ;;
        --cat)    CATEGORY="$2"; shift 2 ;;
        --tags)   TAGS="$2";     shift 2 ;;
        --date)   DATE="$2";     shift 2 ;;
        -h|--help)
            echo "用法: $0 [选项]"
            echo ""
            echo "选项 (全部可选，缺省则交互式提示):"
            echo "  --title  \"文章标题\""
            echo "  --slug   \"url-slug\""
            echo "  --desc   \"一句话描述\""
            echo "  --cat    \"分类\"          (如 AI、随想、工具、生活)"
            echo "  --tags   \"标签1,标签2\""
            echo "  --date   \"YYYY-MM-DD\"    (默认今天: $DATE)"
            exit 0
            ;;
        *) echo "未知参数: $1 (使用 -h 查看帮助)"; exit 1 ;;
    esac
done

# ---------- 交互式补全缺失字段 ----------
if [[ -z "$TITLE" ]]; then
    read -rp "文章标题: " TITLE
fi
if [[ -z "$TITLE" ]]; then
    echo "错误: 标题不能为空" >&2
    exit 1
fi

if [[ -z "$SLUG" ]]; then
    # 从标题生成默认 slug 建议：英文小写+连字符
    DEFAULT_SLUG="$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g; s/--*/-/g; s/^-//; s/-$//')"
    read -rp "URL slug [$DEFAULT_SLUG]: " SLUG
    SLUG="${SLUG:-$DEFAULT_SLUG}"
fi
if [[ -z "$SLUG" ]]; then
    echo "错误: slug 不能为空" >&2
    exit 1
fi

if [[ -z "$DESC" ]]; then
    read -rp "一句话描述: " DESC
fi

if [[ -z "$CATEGORY" ]]; then
    echo "可选分类: AI | 随想 | 工具 | 生活 | Big Data"
    read -rp "分类 [AI]: " CATEGORY
    CATEGORY="${CATEGORY:-AI}"
fi

if [[ -z "$TAGS" ]]; then
    read -rp "标签 (逗号分隔): " TAGS
fi

# ---------- 创建文章 ----------
POST_DIR="$CONTENT_DIR/$SLUG"

if [[ -d "$POST_DIR" ]]; then
    echo "错误: 目录已存在 → $POST_DIR" >&2
    exit 1
fi

mkdir -p "$POST_DIR"

# 构造 tags YAML
TAGS_YAML=""
if [[ -n "$TAGS" ]]; then
    IFS=',' read -ra TAG_ARRAY <<< "$TAGS"
    for tag in "${TAG_ARRAY[@]}"; do
        tag="$(echo "$tag" | sed 's/^ *//; s/ *$//')"
        TAGS_YAML+="    - ${tag}"$'\n'
    done
fi

cat > "$POST_DIR/index.md" << EOF
---
title: "$TITLE"
description: "$DESC"
date: $DATE
slug: $SLUG
categories:
    - $CATEGORY
tags:
${TAGS_YAML}---

<!-- 在这里开始写作 -->
EOF

# ---------- 输出结果 ----------
echo ""
echo "============================================"
echo "  新文章已创建"
echo "============================================"
echo ""
echo "  文件: content/post/$SLUG/index.md"
echo "  URL:  /p/$SLUG/"
echo "  日期: $DATE"
echo ""
echo "--------------------------------------------"
echo "  文章骨架内容:"
echo "--------------------------------------------"
cat "$POST_DIR/index.md"
echo "--------------------------------------------"
echo ""
echo "后续操作:"
echo "  1. 编辑文章  → content/post/$SLUG/index.md"
echo "  2. 添加封面  → 将图片放入 content/post/$SLUG/ 并在 front matter 添加 image: 文件名"
echo "  3. 本地预览  → hugo server -D"
echo "  4. 发布上线  → git add . && git commit && git push"
echo ""
