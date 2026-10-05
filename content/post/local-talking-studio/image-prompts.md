# 配图方案与可选封面 Prompt

## 视觉方案

- Primary skill: `guige-svg`
- Primary style/layout/aspect: 深色技术架构图，横向 16:10 左右，直接编写可编辑 SVG。
- Why: 两台主机和多个 API 的真实连接关系，比抽象模型海报更能帮助读者理解。
- Per-image overrides: 封面使用 AI 编辑插画；机器图使用已有实拍；Diana 使用已有视频和封面帧。

## 已有素材

`4090-photo.webp` 复用 `qwen-image-turbo` 的 4090 实拍；`mac-mini-photo.webp` 复用 `mac-mini-ai-workstation` 的 Mac 实拍。`diana-talk.mp4` 与 `diana-poster.webp` 复用前文成片。

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
