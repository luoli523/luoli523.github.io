# 配图方案与可选封面 Prompt

## 视觉方案

- Primary skill: `guige-svg`
- Primary style/layout/aspect: 深色技术架构图，横向 16:10 左右，直接编写可编辑 SVG。
- Why: 两台主机和多个 API 的真实连接关系，比抽象模型海报更能帮助读者理解。
- Per-image overrides: 封面使用 AI 编辑插画；机器图使用已有实拍；Diana 使用已有视频和封面帧。

## 已有素材

`4090-photo.webp` 复用 `qwen-image-turbo` 的 4090 实拍；`mac-mini-photo.webp` 复用 `mac-mini-ai-workstation` 的 Mac 实拍。`diana-talk.mp4` 与 `diana-poster.webp` 复用前文成片。

## 已完成的工作台实截（2026-10-07）

以下八张图片来自 `http://localhost:8080/audio-studio` 的真实界面，不是 AI 模拟。通过终端启动无头 Chrome，使用用户本人登录会话截图，再转换为 WebP。声音设计和播报表单填写了示例文字，未提交新的生成任务；Diana 视频及字幕是已存在的真实结果。

| 建议文件名 | 截图内容 | 正文位置 |
|---|---|---|
| studio-voice-library.webp | 工作台导航、音色库、参考录音上传与现有音色列表 | 音色库介绍之后 |
| studio-voice-design.webp | 文字设计音色表单、声音描述、语言、试听文案 | VoiceDesign 介绍之后 |
| studio-portraits.webp | 人物库中的 Diana、人物名称、默认音色 | 人物库介绍之后 |
| studio-narration.webp | Serena、示例文案和语速表单，不包含无关历史任务 | 生成播报介绍之后 |
| studio-images.webp | Turbo/基础模型选择、参考图编辑、已有图像结果 | Qwen 图像工作台介绍之后 |
| studio-video.webp | 4090 H3 引擎、Diana、文本配音入口、步数及预览参数 | 视频生成介绍之后 |
| studio-video-result.webp | 已完成的 Diana 十二步短预览、字幕版播放和下载入口 | 视频参数图之后 |
| studio-captions.webp | Diana 视频的字幕编辑器、逐句时间轴、样式和导出 | 字幕编辑介绍之后 |

截图仅切换页面、填写未提交的示例、展开现有结果，不提交新生成任务、保存修改或发送 TG。音色库和图像工作台保留导航，其他图片聚焦对应表单或 Diana 卡片。已逐张检查，未截入密钥、Telegram 配置、账户信息或其他人物照片；字幕编辑器展示成片现有识别文字，仍需人工校对。

## service-architecture.webp — 服务架构

Skill/style: `guige-svg / dark architecture / landscape`
Role: architecture
Intent: 让读者看到浏览器、Mac、SSH 隧道、4090 模型与本机字幕的分工。

可编辑源文件：`diagram/service-architecture.svg`。校验及渲染后导出 PNG，再转换 WebP。图中不出现实际 SSH IP、用户名、密钥或个人音色参考录音。

## cover.webp — 本地 AI 演播室

Skill/style: `guige-imagen / editorial illustration / 16:9`
Role: cover
Intent: 以两台机器和一个口播角色表达家庭 AI 演播室。使用 Codex 内置图像生成工具，输出转换为 WebP。

横向 16:9 科技博客编辑插画。一张真实有人使用的桌面，银色小型 Mac mini 与带 GeForce 显卡的紧凑工作站，显示器里是一位蓝发、圆眼镜的卡通女性主持人，旁边有短文稿、音频波形和字幕时间轴。淡淡的青绿色与琥珀色连接线把电脑、声音、人物与视频串起来。重点是个人创作者自己的小演播室，温暖桌灯，材质可信，画面简洁，不要科幻机房，不要品牌水印，不要伪造软件截图，不要密集文字。若使用文字，仅写“本地 AI 演播室”。

### 实际生成 Prompt

Create a polished landscape 16:9 Chinese technology blog cover, editorial illustration blending believable product rendering and gentle stylized 3D animation. Scene: a personal creator's compact AI recording studio on a walnut desk in a warm study, a small silver Mac mini clearly visible in foreground left and a compact black workstation with a GeForce-style graphics card visible through its side on the right, large monitor at center showing Diana: friendly cartoon female presenter, short dark blue bob with electric blue highlights, round thin glasses, blue sweatshirt, smiling while speaking. On monitor beneath her, simple elegant audio waveform and a sparse video timeline with subtitle bars, not a fabricated detailed software screenshot. Thin restrained teal and amber luminous connections link the two computers to audio and video symbols. Warm desk lamp light mixed with subtle teal screen glow, tactile aluminum and wood, sophisticated inviting personal workspace, clean readable silhouette at thumbnail size. Text verbatim: '本地 AI 演播室', large crisp Chinese headline in the upper left with clear negative space and high contrast, smaller subtitle 'Mac mini + 4090' underneath. No other text, no watermark, no corporate server room, no extra people, no chaotic cables, no dense infographics. It should convey that an individual has connected their own two machines to create speaking character videos locally. This is a brand new cover image.
