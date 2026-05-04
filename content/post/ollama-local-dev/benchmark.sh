#!/usr/bin/env bash
set -euo pipefail

MODEL="${MODEL:-gemma4:26b}"
OUT_DIR="${OUT_DIR:-benchmark-results}"
mkdir -p "$OUT_DIR"

run_case() {
  local name="$1"
  local prompt="$2"
  local output="$OUT_DIR/${name}.json"

  printf '\n== %s ==\n' "$name"
  curl -s http://localhost:11434/api/chat \
    -H 'Content-Type: application/json' \
    -d "$(jq -n \
      --arg model "$MODEL" \
      --arg prompt "$prompt" \
      '{
        model: $model,
        messages: [
          {role: "user", content: $prompt}
        ],
        stream: false
      }')" > "$output"

  jq -r '
    def ns_to_s: ./1000000000;
    {
      model,
      total_s: (.total_duration | ns_to_s),
      load_s: (.load_duration | ns_to_s),
      prompt_eval_count,
      prompt_eval_s: (.prompt_eval_duration | ns_to_s),
      prompt_tokens_per_s: (
        if .prompt_eval_duration > 0
        then (.prompt_eval_count / (.prompt_eval_duration | ns_to_s))
        else null
        end
      ),
      eval_count,
      eval_s: (.eval_duration | ns_to_s),
      output_tokens_per_s: (
        if .eval_duration > 0
        then (.eval_count / (.eval_duration | ns_to_s))
        else null
        end
      ),
      done_reason
    }
  ' "$output" | tee "$OUT_DIR/${name}.summary.json"
}

run_case "01-short-chat" "用三句话解释 Ollama 是什么，并给一个适合开发者的类比。"

run_case "02-long-chinese-output" "请用中文写一段约 1200 字的通俗教程，解释如何用 Ollama 在本机部署大模型。要求包含安装、拉取模型、运行对话、API 调用、常见坑五部分。"

run_case "03-code-generation" "请写一个 FastAPI 示例服务，提供 /health 和 /chat 两个接口，其中 /chat 接收 JSON 格式的 message 字段，并调用本地 Ollama 的 /api/chat 接口。请给出完整代码和运行命令。"

run_case "04-code-review" "下面是一段 Python 代码，请指出 bug、风险和改进建议，并给出修复后的版本：\n\nimport json\nfrom pathlib import Path\n\ndef load_config(path):\n    data = Path(path).read_text()\n    return json.loads(data)\n\ndef save_user(user, path='users.json'):\n    users = load_config(path)\n    users.append(user)\n    Path(path).write_text(json.dumps(users))\n\nsave_user({'name': 'alice'})"

run_case "05-agent-planning" "你是一个本地开发 Agent。请为一个 Hugo 博客新增文章功能制定执行计划：需要读取仓库结构、创建 content/post/<slug>/index.md、生成配图 prompt、校验 frontmatter 和图片引用。输出具体命令和检查点。"
