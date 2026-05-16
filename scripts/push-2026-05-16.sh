#!/bin/bash
# 2026-05-16 AI 技术日报 推送脚本（飞书 + Bark）

echo "=== 推送飞书卡片 ==="
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
-H 'Content-Type: application/json' \
-d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年5月16日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 🔥 今日要闻\n\n**1. Recursive Superintelligence 携 $6.5 亿融资出隐身**\n前 Salesforce 首席科学家 Richard Socher 创办，估值 $46.5 亿。GV（Google 风投）领投，Nvidia、AMD 参与。打造\"递归自我改进\" AI——模型能自主发现弱点、设计修复方案、实施改进，无需人工干预。计划 2026 年中公开发布。\n\n**2. Sakana AI「RL Conductor」：7B 小模型指挥万亿参数大模型**\n仅 70 亿参数的编排模型，通过强化学习训练后能调度 GPT-5、Claude、Gemini 协同工作。AIME25 数学 93.3%、GPQA-Diamond 87.5%，token 消耗仅为传统方案的 1/6。论文入选 ICLR 2026。已商业化为 Sakana Fugu 产品。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. 微软 MDASH：100+ AI Agent 发现 16 个 Windows 零日漏洞**\n多模型 Agent 安全扫描系统，编排 100+ 专用 Agent，发现 16 个未知漏洞（含 4 个 Critical 级 RCE）。Agent 之间会\"辩论\"交叉验证，端到端证明漏洞可利用性。\n\n**4. 百度文心 5.1：训练成本仅为行业 6%**\n5 月 9 日发布，LMArena 搜索榜 1223 分，国内第一、全球第四。参数压缩至文心 5.0 的 1/3，Agent 能力超越 DeepSeek-V4-Pro。采用\"多维弹性预训练\"技术。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 💰 前沿模型 API 价格对比\n\n| 模型 | 输入 $/1M tokens | 输出 $/1M tokens |\n|---|---|---|\n| GPT-5.5 | $5.00 | $30.00 |\n| Claude Opus 4.7 | $5.00 | $25.00 |\n| Gemini 3.1 Pro | $2.00 | $12.00 |\n| Claude Sonnet 4.6 | $3.00 | $15.00 |\n| Claude Haiku 4.5 | $1.00 | $5.00 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 🌟 热门开源项目 Top 3\n\n**1. agentmemory** ⭐ 9,665（+6,865/周）\nAI 编码 Agent 的持久记忆系统，让 Cursor/Copilot 等跨会话保留经验\n\n**2. UI-TARS-desktop** ⭐ 34,095（+3,529/周）\n字节跳动多模态桌面 Agent，通过\"看屏幕+点鼠标\"自主操作电脑\n\n**3. anthropics/financial-services** ⭐ 23,300（+9,480/周）\nAnthropic 官方金融行业 AI 参考架构和代码实现"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 💵 本周重大融资\n\n| 公司 | 金额 | 估值 |\n|---|---|---|\n| Sierra | $9.5 亿 E 轮 | $150 亿 |\n| Recursive Superintelligence | $6.5 亿 | $46.5 亿 |\n| Rhoda AI | $4.5 亿 A 轮 | $17 亿 |\n| SubQ | $2900 万种子轮 | $5 亿 |\n\nQ1 2026 全球风投 $3000 亿创纪录，AI 占 80%"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 🎯 趋势洞察\n\n1. **Agent 编排层成新基础设施**：小模型指挥大模型、多 Agent 协作成主流\n2. **超长上下文重塑全量理解**：SubQ 12M token 窗口让 RAG 部分场景可简化\n3. **模型定价进入场景分层时代**：不同场景路由不同模型可降本 40-60%\n4. **Agent 从对话走向专业工作**：安全审计、客服、工业机器人控制\n\n📖 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-16.md)"
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
echo "=== 推送 Bark 通知 ==="
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-05-16/Recursive%20Superintelligence%20%E6%90%BA%246.5%E4%BA%BF%E8%9E%8D%E8%B5%84%E5%87%BA%E9%9A%90%E8%BA%AB%EF%BC%8CSakana%20AI%207B%E5%B0%8F%E6%A8%A1%E5%9E%8B%E6%8C%87%E6%8C%A5GPT-5%E5%8D%8F%E5%90%8C%E4%BD%9C%E6%88%98%EF%BC%8C%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%85%A8%E6%96%87?url=https%3A%2F%2Fgithub.com%2Fkinggao23-droid%2FAI-Daily%2Fblob%2Fmain%2F2026-05-16.md&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "=== 推送完成 ==="
