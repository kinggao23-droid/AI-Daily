# AI Daily Report

每日自动生成的 AI 行业 + LLMOps 竞品情报日报，每天北京时间 **09:00** 通过 GitHub Actions 自动生成 + 邮件推送。

---

## 📁 仓库结构

```
.
├── 2026-MM-DD.md            ← 综合版日报 (今日要闻/技术原理/产品启示)
├── llmops/
│   └── 2026-MM-DD.md        ← LLMOps 竞品情报日报 (国内外平台动向)
├── generate_report.py       ← 日报生成 + 邮件发送脚本
├── .github/workflows/
│   └── daily.yml            ← GitHub Actions 工作流 (每天 09:00 北京时间触发)
├── SETUP_GUIDE.md           ← 配置指南 (Secrets、Gmail 应用密码等)
└── README.md                ← 本文档
```

---

## 🚀 快速开始

如果你 **首次使用** 或 **从其他设备 fork** 本仓库, 请按 [SETUP_GUIDE.md](./SETUP_GUIDE.md) 完成配置 (大约 5 分钟)。

简要步骤:
1. 在 GitHub 仓库 Settings → Secrets 设置 3 个密钥:
   - `ANTHROPIC_API_KEY` (Claude API Key)
   - `EMAIL_USERNAME` (你的 Gmail)
   - `EMAIL_PASSWORD` (Gmail 应用专用密码, 不是登录密码)
2. 进入 Actions → AI Daily Report → Run workflow 手动触发一次, 验证流程
3. 等明天 09:00 自动收邮件

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

## 1. 今日要闻 (3 条)
   每条包含: 平台 + 时间 + 具体更新 + 设计理念解读 + 影响分析 + 链接

## 2. 功能创新追踪 (含横向对比表 + 重点功能深度解读)

## 3. 价格与商业动态

## 4. 平台/工具新动向

## 5. 对产品经理的启示 (4-5 条 actionable 建议)
```

---

## ⚙️ 技术栈

- **生成**: Anthropic Claude API (启用 Web Search 工具,获取实时信息)
- **调度**: GitHub Actions (cron `0 1 * * *` UTC = 09:00 北京时间)
- **存储**: 本仓库 (永久归档)
- **推送**: Gmail SMTP

---

## 🛠️ 自定义

- **改时间**: 编辑 `.github/workflows/daily.yml` 的 cron 表达式
- **改格式**: 编辑 `generate_report.py` 顶部的 `GENERAL_DAILY_PROMPT` / `LLMOPS_DAILY_PROMPT`
- **改模型**: 在仓库 Variables 里设置 `CLAUDE_MODEL`, 默认 `claude-opus-4-7`
- **加通道** (飞书/企微/Bark): 在 `generate_report.py` 末尾增加对应 webhook 调用

详见 [SETUP_GUIDE.md](./SETUP_GUIDE.md)。

---

## 📝 维护历史

- **2026-04-25**: 重建自动化 — 真正的 GitHub Actions + Anthropic API (含 Web Search) + Gmail SMTP 链路
- **历史归档**: 仓库内 4-19 / 4-20 / 4-22 等历史日报为人工编辑版本, 保留作为格式参考
