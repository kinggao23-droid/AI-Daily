#!/bin/bash
# AI 技术日报 2026-07-14 推送脚本（飞书 + Bark）
# 在本地或有外网访问权限的环境中运行

# === 飞书推送 ===
echo "📤 推送到飞书..."
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
  -H 'Content-Type: application/json' \
  -d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年7月14日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 今日要闻\n\n**1. Meta 首推付费 API：Muse Spark 1.1** — $1.25/$4.25 每百万 token，为 GPT-5.6 Sol 的 1/4，MCP Atlas 工具使用得分 88.1（GPT-5.5 为 75.3）\n\n**2. OpenAI GPT-5.6 三级体系全面上线** — Sol $5/$30 | Terra $2.50/$15 | Luna $1/$6，Sol Ultra 综合分 91.9%，缓存读取折扣 90%，GPT-4 产品线正式退役\n\n**3. xAI Grok 4.5 发布** — $2/$6 每百万 token，每任务仅消耗 14K 输出 token（Opus 4.8 约 67K），实际每任务成本约 $0.08\n\n**4. 智谱 GLM-5.2 编码超越 GPT-5.5** — SWE-bench Pro 62.1% vs 58.6%，753B 参数 MIT 开源，运行成本仅为 GPT-5.5 的 1/6\n\n**5. Apple 起诉 OpenAI 商业秘密盗窃** — 指控系统性招聘 400+ 名前 Apple 员工窃取技术秘密"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 热门开源项目 Top 3\n\n🥇 **Meetily** ⭐ 24,187（本周 +5,392）— 隐私优先 AI 会议助手，完全本地运行，数据不上云\n[github.com/Zackriya-Solutions/meetily](https://github.com/Zackriya-Solutions/meetily)\n\n🥈 **Orca** ⭐ 18,291（本周 +5,263）— 多 Agent 并行开发环境，1-50 个 AI 同时编码取最优方案\n[github.com/stablyai/orca](https://github.com/stablyai/orca)\n\n🥉 **CubeSandbox** ⭐ 9,992（本周 +2,367）— 腾讯云 AI Agent 沙箱，60ms 冷启动，<5MB 内存\n[github.com/TencentCloud/CubeSandbox](https://github.com/TencentCloud/CubeSandbox)"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 产品动态\n\n• **NVIDIA Nemotron-Labs-Diffusion**: 三模态语言模型，推理速度提升 6 倍，每步接受 6.82 token\n• **腾讯混元 Hy3**: 295B 参数开源（Apache 2.0），API ¥1/¥4 每百万 token\n• **美团 LongCat-2.0**: 1.6 万亿参数，全程 5 万张国产 GPU 训练，MIT 开源\n• **Gemini 3.5 Pro**: 可能 7/17 发布，2M 上下文窗口（未经证实）"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 资本动态\n\n| 事件 | 金额 |\n|---|---|\n| Together AI C 轮 | $8 亿，估值 $83 亿 |\n| Tripo AI A 轮扩展 | $1.5 亿 |\n| Zeroth A 轮（蚂蚁领投） | $7,360 万 |\n| H1 2026 全球 AI 投资 | $5,100 亿（超 2025 全年） |\n\n## 行动建议\n\n1. 模型价格战全面爆发——建立模型成本监控面板\n2. 多 Agent 并行从概念变工具——评估 Orca 等是否适合研发流程\n3. 本地 AI 成企业刚需——审视哪些数据流可改为端侧处理\n4. 中国开源模型改变格局——将 GLM-5.2、混元 Hy3 纳入评估\n5. Apple vs OpenAI 诉讼——重新审视人才策略和 IP 保护\n\n📖 [点击查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-14.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'
echo ""

# === Bark 推送 ===
echo "📱 推送到 Bark..."
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-07-14/Meta%20%E9%A6%96%E6%8E%A8%E4%BB%98%E8%B4%B9API%E4%BB%85GPT-5.6%E7%9A%841%2F4%E4%BB%B7%E6%A0%BC%EF%BC%8C%E6%99%BA%E8%B0%B1GLM-5.2%E5%BC%80%E6%BA%90%E7%BC%96%E7%A0%81%E8%B6%85%E8%B6%8AGPT-5.5%EF%BC%8C%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%85%A8%E6%96%87?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-14.md&group=AI%E6%97%A5%E6%8A%A5"
echo ""
echo "✅ 推送完成！"
