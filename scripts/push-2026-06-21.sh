#!/bin/bash
# AI 技术日报 2026-06-21 推送脚本（飞书 + Bark）

# === 飞书卡片推送 ===
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
  -H 'Content-Type: application/json' \
  -d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年6月21日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 一、今日要闻\n\n**1️⃣ GPT-5.6 本周发布概率 83%**\nPolymarket 预测市场给出 6月22-28日发布概率 83%。预计上下文扩展至 150 万 tokens（↑43%），价格降至 GPT-5.5 的约 1/3（输入约 $1.67，输出约 $10.00/百万 tokens），重点优化 Agent 工作流。\n\n**2️⃣ SpaceX $600 亿收购 Cursor**\n6月16日，SpaceX 以全股票交易收购 AI 编程助手 Cursor（母公司 Anysphere），创风投支持创业公司被收购历史最高纪录。Cursor 已被 67% 的财富500强使用，日生成 1.5 亿行代码。"
      },
      {
        "tag": "markdown",
        "content": "**3️⃣ Agentjacking 攻击：85% 成功率劫持 AI 编程助手**\nTenet Threat Labs 披露新型攻击，通过伪造 Sentry 错误报告可劫持 Claude Code、Cursor、Codex，2,388 个组织暴露在风险中。Sentry 确认但拒绝修复，称\"技术上无法防御\"。\n\n**4️⃣ Google Chrome 自动浏览功能本月底上线**\nChrome auto-browse 将于6月底登陆 Android，首批支持 Pixel 10 和 Galaxy S26，计划年底覆盖 2 亿台设备。AI 自动完成预约、比价、下单等多步骤网页任务。\n\n**5️⃣ 互联网流量分水岭：机器人 57.5% 首超人类 42.5%**\nCloudflare 数据显示 AI Agent 式爬虫推动机器人流量首次超过人类，比预期提前一年。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 二、热门开源项目 Top 3\n\n🔥 **Hermes Agent** — 188K ⭐\n自我进化 AI Agent 框架，8 周内从 0 涨到 99K Stars。具有持久记忆和技能积累能力，NVIDIA 选为参考运行时。\n[GitHub](https://github.com/NousResearch/hermes-agent)\n\n🔥 **OpenCode** — 165K ⭐\n开源版 Claude Code，基于 Go 的终端 AI 编程助手，支持 75+ AI 提供商，月活 750 万开发者。MIT 协议。\n[GitHub](https://github.com/opencode-ai/opencode)\n\n🔥 **n8n** — 193K ⭐\nAI 工作流自动化平台，拖拽搭建 AI Agent 流程，400+ 集成，可自托管。\n[GitHub](https://github.com/n8n-io/n8n)"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 三、产品动态\n\n| 产品 | 关键信息 |\n|------|----------|\n| DeepSeek V4 Pro | 永久降价 75%：输入 $0.435，输出 $0.87/百万 tokens |\n| Qwen 3.7 Plus | 多模态 Agent 模型，输入 $0.40/输出 $1.60，ScreenSpot Pro 79.0 分 |\n| NVIDIA Nemotron 3 Ultra | 550B 开源旗舰，GPQA Diamond 86.7%，混合 Mamba-Transformer |\n| Microsoft MAI 系列 | MAI-Thinking-1（AIME 97%）+ MAI-Code-1-Flash（5B 参数，SWE-Bench 51%）|\n| Snap SPECS | $2,195 AR 眼镜，132g 独立运行，51° 视场角，秋季发货 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 四、资本与行业格局\n\n| 公司 | 最新估值 | 动态 |\n|------|---------|------|\n| SpaceX+xAI | $1.25 万亿 | IPO 募资 $750 亿 + $600 亿收购 Cursor |\n| Anthropic | $9,650 亿 | IPO 已提交，目标 10 月上市募 $600 亿+ |\n| OpenAI | $8,520 亿 | 融资 $1,220 亿，IPO 筹备中 |\n| Suno | $54 亿 | Series D $4 亿，日生成 700 万首歌 |\n| Fable 5 | — | 停服第 9 天，恢复日期未定 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 五、趋势洞察\n\n📌 **AI Agent 安全成紧迫问题** — Agentjacking 85% 成功率，立即审计 Agent 权限\n📌 **模型价格自由落体** — 最低输出价已降至 $0.87/百万 tokens，重算成本模型\n📌 **移动端 Agent 时代开启** — Chrome auto-browse 覆盖 2 亿设备，优化产品 Agent 兼容性\n📌 **AI 编程工具巨头整合** — SpaceX 收购 Cursor，不要押注单一工具\n\n📖 [查看完整日报 →](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-21.md)"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'

echo ""
echo "飞书推送完成"
echo ""

# === Bark 推送 ===
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-06-21/GPT-5.6%20%E6%9C%AC%E5%91%A8%E5%8F%91%E5%B8%83%E6%A6%82%E7%8E%8783%25%EF%BC%8CSpaceX%20%24600%E4%BA%BF%E6%94%B6%E8%B4%ADCursor%E5%88%9B%E7%BA%AA%E5%BD%95%EF%BC%8CAgentjacking%E6%94%BB%E5%87%BB85%25%E6%88%90%E5%8A%9F%E7%8E%87%E5%8A%AB%E6%8C%81AI%E7%BC%96%E7%A8%8B%E5%8A%A9%E6%89%8B%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%85%A8%E6%96%87%E2%86%92?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-21.md&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "Bark 推送完成"
