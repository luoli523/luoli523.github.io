# Gemma4 26B on Ollama Benchmark Summary

Date: 2026-05-04

## Environment

- GPU: NVIDIA GeForce RTX 4090
- GPU memory reported by `nvidia-smi`: 49140 MiB
- NVIDIA driver: 570.158.01
- CUDA: 12.8
- Ollama: 0.23.0
- Model: `gemma4:26b`
- Model size in `ollama list`: 17 GB
- Loaded model memory in `ollama ps`: 25 GB
- Loaded processor: 100% GPU
- Loaded context: 262144

## Ollama API Benchmarks

| Case | Total s | Load s | Prompt tokens | Prompt tokens/s | Output tokens | Output tokens/s |
|---|---:|---:|---:|---:|---:|---:|
| Short chat | 4.790 | 0.192 | 34 | 385.91 | 697 | 165.93 |
| Long Chinese output | 18.728 | 0.157 | 63 | 2549.37 | 2785 | 160.84 |
| Code generation | 13.337 | 0.158 | 68 | 2832.26 | 1985 | 161.66 |
| Code review | 14.430 | 0.154 | 142 | 4324.03 | 2143 | 161.16 |
| Agent planning | 13.631 | 0.150 | 69 | 2806.62 | 2028 | 161.48 |
| Long monitored generation | 24.020 | 0.158 | 72 | 1862.27 | 3554 | 159.79 |

## GPU Load During Long Generation

Captured with:

```bash
nvidia-smi dmon -s pucvmet -c 20
```

Observed after load ramp:

- Power: mostly 260-265 W
- GPU temperature: 54-60 C
- SM utilization: mostly 82-87%
- Memory utilization: mostly 50-55%
- Framebuffer memory: 24529 MB
- Memory clock: 10501 MHz
- Graphics clock: 2670-2685 MHz

## Toolchain Checks

- Codex CLI: `codex-cli 0.128.0`
- Claude Code: `2.1.126`
- Hermes Agent: `Hermes Agent v0.12.0 (2026.4.30)`

## Agent Notes

- Codex launched with `--oss --local-provider ollama -m gemma4:26b`. With the default read-only sandbox, its internal Linux sandbox hit `bwrap: loopback: Failed RTM_NEWADDR: Operation not permitted` when trying to read files.
- After explicit user authorization, Codex ran successfully with `--dangerously-bypass-approvals-and-sandbox`:

```bash
codex exec \
  --oss \
  --local-provider ollama \
  -m gemma4:26b \
  --dangerously-bypass-approvals-and-sandbox \
  --ephemeral \
  "请阅读当前目录的 benchmark.sh，简要说明它会如何测试 Ollama 本地模型性能，不要修改任何文件。"
```

Codex result:

- Status: success
- Sandbox mode reported by Codex: `danger-full-access`
- It executed `cat benchmark.sh`
- It correctly summarized the benchmark flow: call local Ollama `/api/chat`, save raw JSON, and use `jq` to compute `load_s`, `prompt_tokens_per_s`, and `output_tokens_per_s`
- Useful conclusion: local model speed is not the only bottleneck; agent sandboxes and tool permissions also matter.

- Claude Code launched successfully through Ollama's Anthropic-compatible API:

```bash
env ANTHROPIC_AUTH_TOKEN=ollama \
  ANTHROPIC_BASE_URL=http://localhost:11434 \
  ANTHROPIC_API_KEY= \
  /home/luoli/.local/bin/claude \
  -p \
  --model gemma4:26b \
  --no-session-persistence \
  --permission-mode dontAsk \
  --tools Read \
  --output-format json \
  "请阅读当前目录的 benchmark.sh，简要说明它如何测试 Ollama 本地模型性能。不要修改任何文件。"
```

Claude Code result:

- Status: success
- Duration: 7889 ms
- API duration: 7824 ms
- Turns: 2
- Input tokens: 16319
- Output tokens: 713
- Model context window reported by Claude Code: 200000
- Max output tokens reported by Claude Code: 32000
- Tool permission denials: 0

- Hermes oneshot ran successfully with `--provider ollama -m gemma4:26b`. `hermes status` reported model `gemma4` and provider `ollama-launch`.
