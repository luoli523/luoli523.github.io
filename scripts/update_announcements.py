#!/usr/bin/env python3
"""
自动为新发布的 Hugo 文章在 data/announcements.yaml 头部插入公告条目。
用法: python3 scripts/update_announcements.py content/post/xxx/index.md
"""

import sys
import re
from pathlib import Path

# 分类 → (颜色, 类型)
CATEGORY_MAP = {
    "AI / LLM": ("teal",   "note"),
    "AI":        ("teal",   "note"),
    "LLM":       ("teal",   "note"),
    "工具":      ("amber",  "tool"),
    "随笔":      ("purple", "note"),
    "生活":      ("red",    "life"),
    "Big Data":  ("amber",  "tool"),
    "大数据":    ("amber",  "tool"),
}


def parse_front_matter(content: str) -> dict:
    match = re.search(r'^---\s*\n(.*?)\n---', content, re.DOTALL)
    if not match:
        return {}
    fm = match.group(1)

    result = {}

    t = re.search(r'^title:\s*["\']?(.+?)["\']?\s*$', fm, re.MULTILINE)
    result["title"] = t.group(1).strip("\"'") if t else "新文章"

    d = re.search(r'^date:\s*\d{4}-(\d{2}-\d{2})', fm, re.MULTILINE)
    result["short_date"] = d.group(1) if d else "??-??"

    s = re.search(r'^slug:\s*["\']?(.+?)["\']?\s*$', fm, re.MULTILINE)
    result["slug"] = s.group(1).strip("\"'") if s else None

    cats = re.findall(r'^\s+-\s+["\']?(.+?)["\']?\s*$', fm, re.MULTILINE)
    result["category"] = cats[0].strip("\"'") if cats else "随笔"

    return result


def main():
    if len(sys.argv) < 2:
        print("用法: update_announcements.py <post_file>")
        sys.exit(1)

    post_path = Path(sys.argv[1])
    if not post_path.exists():
        print(f"文件不存在: {post_path}")
        sys.exit(0)

    fm = parse_front_matter(post_path.read_text(encoding="utf-8"))
    cat = fm["category"]
    color, typ = CATEGORY_MAP.get(cat, ("teal", "note"))

    link_line = f"  link: /p/{fm['slug']}/\n" if fm.get("slug") else ""
    # 用单引号包裹 text 字段，避免标题中含中文双引号时被 YAML 解析器误判。
    # 若标题本身含单引号，则按 YAML 规范双写转义。
    safe_title = fm["title"].replace("'", "''")
    new_entry = (
        f"- date: \"{fm['short_date']}\"\n"
        f"  color: {color}\n"
        f"  type: {typ}\n"
        f"  tag: 新文章\n"
        f"  text: '新文章：<strong>{safe_title}</strong>'\n"
        f"{link_line}"
    )

    ann_path = Path("data/announcements.yaml")
    existing = ann_path.read_text(encoding="utf-8")

    # 找到注释块结束位置，在第一条数据前插入
    lines = existing.split("\n")
    insert_pos = 0
    for i, line in enumerate(lines):
        if line.startswith("#") or line.strip() == "":
            insert_pos = i + 1
        else:
            break

    lines.insert(insert_pos, "")
    lines.insert(insert_pos, new_entry.rstrip())

    ann_path.write_text("\n".join(lines), encoding="utf-8")
    print(f"✓ 已添加公告：{fm['title']}")


if __name__ == "__main__":
    main()
