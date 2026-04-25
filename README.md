# AI Daily Report

每日自动生成的 AI 行业 + LLMOps 竞品情报日报。

**核心特点**：

- 🚀 用 **macOS launchd 定时任务** 驱动，**完全使用你的 Claude Max 订阅**（无 API Key 费用）
- 📅 每天北京时间 **18:00** 自动触发
- 🔍 Claude Code 实时调用 **WebSearch** 抓取最新行业动态
- 📰 同时生成两份日报：综合版 + LLMOps 竞品情报版
- 📨 推送到 **飞书群机器人** + **iPhone Bark App**
- 💾 永久归档到本 GitHub 仓库

---

## 📁 仓库结构

```
.
├── 2026-MM-DD.md                       ← 综合版日报 (auto-generated)
├── llmops/2026-MM-DD.md                ← LLMOps 竞品情报版 (auto-generated)
├── scripts/
│   ├── run_daily.sh                    ← 主入口脚本 (launchd 调用)
│   ├── prompts/
│   │   ├── general.md                  ← 综合版提示词模板
│   │   └── llmops.md                   ← LLMOps 专题提示词模板
│   └── send_notification.py            ← 飞书 + Bark 推送逻辑
├── launchd/
│   └── com.kinggao.ai-daily.plist      ← macOS launchd 定时配置
├── .ai-daily.env.example               ← 凭据模板 (填飞书/Bark URL)
├── README.md
└── SETUP_GUIDE.md                      ← 详细配置指南 (10 分钟搞定)
```

---

## 🚀 快速开始

详细步骤见 [SETUP_GUIDE.md](./SETUP_GUIDE.md)，简要 6 步：

1. clone 仓库到 `~/AI-Daily`
2. 配置飞书自定义机器人 → 拿 webhook URL
3. iPhone 安装 Bark App → 拿推送 URL
4. 填 `~/.ai-daily.env`（飞书 + Bark 凭据）
5. `cp launchd/com.kinggao.ai-daily.plist ~/Library/LaunchAgents/` + `launchctl bootstrap`
6. 立即测试：`launchctl kickstart -p gui/$(id -u)/com.kinggao.ai-daily`

---

## 📅 日报格式

### 综合版 (`<日期>.md`)

```
# AI 技术日报 - YYYY年MM月DD日

## 一、今日要闻 (4-5 条)
   每条包含: 概述 + 核心技术原理 + 对产品的启示

## 二、热门开源项目

## 三、产品动态 (表格)

## 四、趋势洞察与行动建议
```

### LLMOps 竞品情报版 (`llmops/<日期>.md`)

```
# LLMOps 竞品情报日报

## 1. 今日要闻 (3 条, 每条含 设计理念解读 + 影响分析)

## 2. 功能创新追踪 (横向对比表 + 重点功能深度解读)

## 3. 价格与商业动态

## 4. 平台/工具新动向

## 5. 对产品经理的启示 (4-5 条 actionable, 含"竞品短板就是你的机会点")
```

---

## ⚙️ 技术栈

- **生成**：Claude Code (`claude --print` headless 模式) + WebSearch 工具
- **调度**：macOS launchd (`StartCalendarInterval` 18:00)
- **存储**：本 GitHub 仓库 (永久归档)
- **推送**：飞书自定义机器人 + Bark iOS App

---

## 🛠️ 自定义

- **改时间**：编辑 `launchd/com.kinggao.ai-daily.plist` 的 `Hour` 字段
- **改提示词**：编辑 `scripts/prompts/general.md` 或 `scripts/prompts/llmops.md`
- **加新通道**（企微/Telegram/邮件）：在 `scripts/send_notification.py` 里加一个 `send_xxx` 函数
- **改关注的竞品**：编辑 `scripts/prompts/llmops.md` 顶部的"重点关注的竞品"清单

详见 [SETUP_GUIDE.md](./SETUP_GUIDE.md)。

---

## 📝 维护历史

- **2026-04-25**: 重建自动化 — 从虚假的 GitHub Actions 改为真实的 macOS launchd + Claude Code 订阅方案，新增飞书 + Bark 推送
- **历史归档**：仓库内 4-19 / 4-20 / 4-22 等历史日报为人工编辑版本，保留作为格式参考
