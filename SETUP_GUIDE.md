# 🚀 AI Daily 配置指南 (本地 launchd 方案)

> 用 **macOS launchd** 定时任务驱动 **Claude Code** 生成日报，**完全使用你的 Claude Max 订阅**，无需 API Key。
> 每天北京时间 **18:00** 自动生成两份日报 + 推送到飞书 + Bark。
> 配置时间：**约 10 分钟**。

---

## 📐 整体架构

```
macOS launchd (每天 18:00 北京时间触发)
   ↓
~/AI-Daily/scripts/run_daily.sh
   ↓
   ├── claude --print (用你的 Claude Max 订阅)
   │     ├── WebSearch 抓取最新 AI 动态
   │     ├── 生成综合版 → 写入 <DATE>.md
   │     └── 生成 LLMOps 专题 → 写入 llmops/<DATE>.md
   │
   ├── git commit & push (推到 GitHub 永久归档)
   │
   └── send_notification.py
         ├── → 飞书机器人 (富文本卡片)
         └── → Bark (iPhone 通知)
```

---

## 一、先决条件检查

```bash
# 1. Claude Code 已安装并登录 (Max 账号)
claude --version

# 2. Python 3 可用
python3 --version

# 3. Git 已配置
git config --global user.name
git config --global user.email

# 4. (一次性) GitHub SSH 或 HTTPS Token 可推送本仓库
git ls-remote git@github.com:kinggao23-droid/AI-Daily.git HEAD
```

如果 `claude --version` 显示有问题，请先确保你日常能在终端跑 `claude` 进入 Claude Code，并且已通过 Max 登录。

---

## 二、Step 1：clone 仓库到固定路径

```bash
git clone git@github.com:kinggao23-droid/AI-Daily.git ~/AI-Daily
cd ~/AI-Daily
```

> ⚠️ 路径必须是 `~/AI-Daily`（即 `/Users/你的用户名/AI-Daily`），launchd plist 默认指向这里。如果想改路径，需要同时修改 `launchd/com.kinggao.ai-daily.plist`。

---

## 三、Step 2：配置飞书机器人

1. 打开飞书 App，找一个你想接收日报的群（建议**新建一个"AI Daily"私人群**，只你一人）
2. 点群名 → **设置** → **群机器人** → **添加机器人**
3. 选 **「自定义机器人」**
4. 起名 `AI Daily Bot`，描述随意
5. **安全设置**（推荐）：勾选 **「签名校验」**，复制生成的 `secret` 字符串
6. 复制 **Webhook 地址**（形如 `https://open.feishu.cn/open-apis/bot/v2/hook/xxxxx`）

---

## 四、Step 3：配置 Bark（iPhone）

1. App Store 搜 **「Bark」**，下载安装（**开源免费**）
2. 打开 App，会自动注册一个推送 key
3. 顶部会显示一个 URL，形如：
   ```
   https://api.day.app/abcdefghijk1234567/
   ```
4. 点 URL 复制到剪贴板

---

## 五、Step 4：填入凭据文件

```bash
# 复制模板到家目录 (家目录文件不会进 git, 安全)
cp ~/AI-Daily/.ai-daily.env.example ~/.ai-daily.env
chmod 600 ~/.ai-daily.env

# 用你喜欢的编辑器打开
open -a "TextEdit" ~/.ai-daily.env
# 或: nano ~/.ai-daily.env
```

填入：

```bash
FEISHU_WEBHOOK="https://open.feishu.cn/open-apis/bot/v2/hook/真实key"
FEISHU_SECRET="飞书签名校验的secret"   # 没启用签名就注释掉这行
BARK_URL="https://api.day.app/你的Bark key"
```

保存关闭。

---

## 六、Step 5：安装 launchd 任务

```bash
# 复制 plist 到 LaunchAgents 目录
cp ~/AI-Daily/launchd/com.kinggao.ai-daily.plist ~/Library/LaunchAgents/

# 加载到 launchd
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.kinggao.ai-daily.plist

# 验证已注册
launchctl list | grep ai-daily
# 期望输出类似: -    0    com.kinggao.ai-daily
```

---

## 七、Step 6：立即测试一次（不用等到 18:00）

```bash
# 手动触发任务 (不影响明天 18:00 的定时)
launchctl kickstart -p gui/$(id -u)/com.kinggao.ai-daily

# 实时查看日志
tail -f ~/Library/Logs/ai-daily/$(date +%Y-%m-%d).log
```

期望看到的日志：
```
🚀 AI Daily 启动 — 2026-04-25 ...
✅ 已加载 ~/.ai-daily.env
📥 git pull...
📰 [1/2] 生成综合版日报 → /Users/你/AI-Daily/2026-04-25.md
✅ 综合版完成 (8000+ chars)
📊 [2/2] 生成 LLMOps 竞品情报 → /Users/你/AI-Daily/llmops/2026-04-25.md
✅ LLMOps 专题完成 (10000+ chars)
💾 提交到 git...
✅ 已推送到 GitHub
📨 推送通知...
✅ 飞书已发送
✅ Bark 已发送
🎉 AI Daily 完成
```

完成后检查：
- ✅ 飞书群应收到一张富文本卡片，含两个跳转按钮
- ✅ iPhone 应收到 Bark 通知（锁屏可见）
- ✅ GitHub 仓库出现今日两个文件

---

## 八、常见问题

### Q1. `launchctl bootstrap` 报错 `Bootstrap failed: 5: Input/output error`

旧版本的 plist 还在加载状态。先卸载再重装：
```bash
launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.kinggao.ai-daily.plist 2>/dev/null
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.kinggao.ai-daily.plist
```

### Q2. 日志显示 `❌ 找不到 claude 命令`

你的 Claude Code 安装路径不在脚本默认查找范围内。修改 `scripts/run_daily.sh` 顶部的 `CLAUDE_BIN` 探测列表，加上你的实际路径。可以用以下命令找到：
```bash
which claude
ls -la $(which claude)
```

### Q3. Mac 在 18:00 时是睡眠状态，会执行吗？

会。launchd plist 里设置了 `WakeFromSleep`，到时间会自动唤醒 Mac 执行任务。如果 Mac **彻底关机**或**盖盖子且电源不足**，则不会执行（次日开机后也不会补跑）。

### Q4. 想改时间，比如改回 09:00

编辑 `~/Library/LaunchAgents/com.kinggao.ai-daily.plist`：
```xml
<key>Hour</key>
<integer>9</integer>     <!-- 改这里 -->
<key>Minute</key>
<integer>0</integer>
```

然后重新加载：
```bash
launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.kinggao.ai-daily.plist
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.kinggao.ai-daily.plist
```

### Q5. 飞书没收到消息

- 检查 webhook URL 是否完整（包含 `https://...hook/xxxxx` 完整段）
- 如果启用了"签名校验"，必须同时填 `FEISHU_SECRET`
- 在终端手动测一下：
  ```bash
  source ~/.ai-daily.env
  python3 ~/AI-Daily/scripts/send_notification.py ~/AI-Daily/2026-04-25.md ~/AI-Daily/llmops/2026-04-25.md
  ```

### Q6. Bark 没收到通知

- 检查 iPhone Bark App 是否允许通知（设置 → 通知 → Bark → 允许）
- 检查 BARK_URL 是否正确（结尾的 `/` 可有可无）
- 手动测试：
  ```bash
  curl "https://api.day.app/你的key/测试/Hello"
  ```
  应该立即收到一条 Bark 通知。

### Q7. 想停止/卸载

```bash
# 停止任务
launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.kinggao.ai-daily.plist

# 完全删除
rm ~/Library/LaunchAgents/com.kinggao.ai-daily.plist
rm ~/.ai-daily.env
# 仓库可以保留, 历史日报有价值
```

### Q8. 想改提示词内容

编辑：
- `scripts/prompts/general.md` — 综合版提示词
- `scripts/prompts/llmops.md` — LLMOps 专题提示词

修改后 `git push` 即可，下次定时执行就会用新提示词。

### Q9. 想加新通道（企业微信、Telegram、邮件）

修改 `scripts/send_notification.py`，参考现有的 `send_feishu` / `send_bark` 函数加一个新函数，并在 `main()` 里调用。

---

## 九、维护建议

- **每周看一次** `~/Library/Logs/ai-daily/` 的最新日志，确认稳定运行
- **每月**手动跑一次本地测试 (`launchctl kickstart -p gui/$(id -u)/com.kinggao.ai-daily`)
- **当 Claude Code 大版本更新**后，确认 `claude --print` 行为没变化（极小概率事件）
- **API 速率限制** Claude Max 的 web search 是有 quota 的，如果某天显示 quota 用完，可以等次日或临时改用更轻量的提示词
