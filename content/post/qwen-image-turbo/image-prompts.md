# 配图来源与处理说明

本文使用用户指定的既有实拍照片与本轮真实模型输出，所有素材已就绪，无需另行生成配图。

## 视觉方案

- Primary skill：不适用；使用已有实拍与实测图。
- 版式：封面保留实拍原比例；四张横向并排图统一左侧基础版 40 步、右侧 Turbo 6 步。
- 原因：让读者直接观察结果，避免生成的示意图混入实测证据。

## 素材清单

- `cover.webp`：复制自博客 `content/post/desktop-ai-studio/guige-4090-rig.webp`，用户此前拍摄的机器照片，未修改。
- `portrait-comparison.webp`、`poster-comparison.webp`、`background-comparison.webp`、`outfit-comparison.webp`：来自 local-tts 的 `output/qwen-image-evaluation/` 同名 JPG。无损转为 WebP，但来源本身为缩放后的 JPEG 拼图。
- `girl-avatar.webp`：本轮实际输入的参考图，由 JPEG 无损转格式。
- `*-base40.webp` 与 `*-turbo6.webp`：共八张，由实际输出 PNG 无损转为 WebP，保留 1024 × 1024 原尺寸。

## 编辑记录

正文已根据四组样片、result.json、environment.json 和当前主机信息核实。结论限于本轮单 seed、单次结果，不将完整工作流耗时描述为纯采样耗时。所有图片均已准备好，不需要等待人工生成图片。

## Diana 口播视频

- `diana-talk.mp4`：工作台 Diana 介绍 DI CLI 的 H3 4090 成片，采用现有 caption-v1-r2 字幕版；512 × 512，H.264 / AAC，约 11.58 秒。任务记录 provider 为 `h3_4090`，12 步。
- `diana-poster.webp`：从该视频第 1 秒提取的封面帧。
- 正文以带播放控件的 HTML video 嵌入，关闭自动预载，另附下载链接。
