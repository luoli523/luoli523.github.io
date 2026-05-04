# 实测截图清单

这些截图需要使用真实终端/桌面截图工具手动采集，保存到本目录。文章会直接引用这些文件。

建议截图统一保存为 PNG 或 WebP，后续统一转换为 WebP。

---

## 1. btop-inference.webp — 系统监控摘要截图

用途：展示 Gemma4 26B 长输出推理后的 GPU、Ollama、内存和关键进程状态。

已生成方式：

当前执行环境没有 `DISPLAY`/`WAYLAND_DISPLAY`，无法直接截取桌面 btop TUI。此图改为用真实命令输出渲染：

```bash
nvidia-smi
ollama ps
free -h
ps -eo pid,comm,%cpu,%mem,rss --sort=-rss | head
```

---

## 2. nvidia-smi-dmon.webp — nvidia-smi dmon 监控截图

用途：展示推理时 GPU 功耗、温度、SM 利用率、显存占用。

操作：

```bash
nvidia-smi dmon -s pucvmet -c 20
```

截图保存为：

```text
nvidia-smi-dmon.webp
```

---

## 3. claude-code-local.webp — Claude Code 本地模型测试截图

用途：展示 Claude Code 通过 Ollama + Gemma4 26B 成功读取文件。

操作：

```bash
cd /home/luoli/dev/git/luoli523.github.io/content/post/ollama-local-dev
env ANTHROPIC_AUTH_TOKEN=ollama \
  ANTHROPIC_BASE_URL=http://localhost:11434 \
  ANTHROPIC_API_KEY= \
  /home/luoli/.local/bin/claude \
  -p \
  --model gemma4:26b \
  --no-session-persistence \
  --permission-mode dontAsk \
  --tools Read \
  "请阅读当前目录的 benchmark.sh，简要说明它如何测试 Ollama 本地模型性能。不要修改任何文件。"
```

截图保存为：

```text
claude-code-local.webp
```

---

## 4. codex-local.webp — Codex 本地模型测试截图

用途：展示 Codex 通过 Ollama + Gemma4 26B，授权绕过 sandbox 后成功读取文件。

操作：

```bash
cd /home/luoli/dev/git/luoli523.github.io/content/post/ollama-local-dev
codex exec \
  --oss \
  --local-provider ollama \
  -m gemma4:26b \
  --dangerously-bypass-approvals-and-sandbox \
  --ephemeral \
  "请阅读当前目录的 benchmark.sh，简要说明它会如何测试 Ollama 本地模型性能，不要修改任何文件。"
```

截图保存为：

```text
codex-local.webp
```

---

## 5. hermes-local.webp — Hermes 本地模型状态截图

用途：展示 Hermes 当前模型和 provider 映射到 Ollama。

操作：

```bash
hermes status
```

截图保存为：

```text
hermes-local.webp
```
