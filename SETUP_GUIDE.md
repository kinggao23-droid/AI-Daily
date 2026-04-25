# 🚀 AI Daily 自动化配置指南

> 5 分钟完成配置，每天北京时间 09:00 自动收到邮件日报。

---

## 一、整体架构

```
GitHub Actions (每天北京时间 09:00 触发)
   ↓
generate_report.py (Python 脚本)
   ↓
   ├── 调用 Anthropic Claude API (启用 Web Search 工具)
   │   ↓
   │   生成 2 份日报:
   │   ├── 2026-MM-DD.md (综合版)
   │   └── llmops/2026-MM-DD.md (LLMOps 竞品情报)
   │
   ├── git commit & push 到本仓库 (永久归档)
   │
   └── SMTP 发送邮件到你的邮箱
       ↓
       手机邮件 App 推送通知 ✉️📱
```

---

## 二、你需要配置的 3 个 GitHub Secrets

打开仓库的 **Settings → Secrets and variables → Actions → New repository secret**, 添加以下 3 个 (前 2 个必需):

### 1. `ANTHROPIC_API_KEY` (必需)

**获取方式**:
1. 访问 [console.anthropic.com](https://console.anthropic.com)
2. 登录后进入 **Settings → API Keys**
3. 点击 **Create Key**, 起个名字如 `AI-Daily-Bot`
4. 复制以 `sk-ant-...` 开头的密钥
5. 粘贴到 GitHub Secret

⚠️ **费用预估**: 每次生成 2 份日报约消耗 0.3 - 1 美元 (含 Web Search 调用), 一个月约 10-30 美元。

---

### 2. `EMAIL_USERNAME` 和 `EMAIL_PASSWORD` (必需, 用于发送邮件)

#### 如果你用 Gmail (推荐):

**步骤 1**: 启用两步验证
- 访问 [myaccount.google.com/security](https://myaccount.google.com/security)
- 找到"两步验证", 按提示开启

**步骤 2**: 生成应用专用密码
- 访问 [myaccount.google.com/apppasswords](https://myaccount.google.com/apppasswords)
- 选择"邮件" + "其他设备", 起名如 `AI Daily Bot`
- 复制生成的 16 位密码 (如 `abcd efgh ijkl mnop`, 注意是 16 位字母,无空格)

**填入 GitHub Secret**:
- `EMAIL_USERNAME` = 你的 Gmail 邮箱 (如 `kinggao23@gmail.com`)
- `EMAIL_PASSWORD` = 16 位应用专用密码 (不是你的 Gmail 登录密码!)

#### 如果你想发到非 Gmail 邮箱 (如 QQ、163):

修改 `generate_report.py` 第 145 行附近的 `smtp.gmail.com` 为对应 SMTP 服务器:
- QQ: `smtp.qq.com` (端口 465 SSL, 需要授权码)
- 163: `smtp.163.com` (端口 465 SSL, 需要授权码)
- Outlook: `smtp.office365.com` (端口 587 STARTTLS)

---

### 3. `EMAIL_TO` (可选)

如果你希望发送到与登录邮箱**不同**的收件邮箱, 在这里填收件地址。
不填则默认发送给 `EMAIL_USERNAME` 自己。

---

## 三、立即测试

配置好 Secrets 后, 立即手动触发一次验证:

1. 打开仓库 **Actions** 标签页
2. 左侧选择 **AI Daily Report**
3. 右侧点击 **Run workflow** → **Run workflow** 按钮
4. 等待 5-10 分钟 (Claude 调用 Web Search + 生成报告)
5. 检查:
   - ✅ 仓库根目录是否出现 `<今天日期>.md`
   - ✅ `llmops/` 目录是否出现 `<今天日期>.md`
   - ✅ 你的邮箱是否收到 2 封邮件

---

## 四、本地手动测试 (可选)

如果你想在本机先测试一遍:

```bash
# 1. clone 仓库
git clone https://github.com/kinggao23-droid/AI-Daily.git
cd AI-Daily

# 2. 设置环境变量
export ANTHROPIC_API_KEY="sk-ant-xxxx"
export EMAIL_USERNAME="kinggao23@gmail.com"
export EMAIL_PASSWORD="abcdefghijklmnop"   # 16 位应用密码

# 3. 跑一次 (不发送邮件,只生成文件)
python3 generate_report.py --no-email

# 4. 跑完整流程 (生成 + 发邮件)
python3 generate_report.py
```

---

## 五、手机端推送优化

邮件到手机后, 默认通知可能不显眼。建议设置:

**iOS**:
- 邮件 App → 设置 → 邮箱 → 选择该邮箱 → **VIP**, 把发件人加为 VIP
- VIP 邮件单独通知, 锁屏可见

**Android**:
- Gmail App → 设置 → 选择账号 → **通知**, 选 "全部" 或针对该发件人单独配置

---

## 六、自定义日报内容

修改 `generate_report.py` 顶部的两个常量:

```python
GENERAL_DAILY_PROMPT = """..."""    # 综合版的提示词模板
LLMOPS_DAILY_PROMPT = """..."""     # LLMOps 专题的提示词模板
```

修改后 `git push`, 第二天自动生效。

如果想增加/减少日报种类 (比如加一个"金融行业 AI 应用"专题), 在 `main()` 函数里参考现有逻辑加一个新的 prompt + 输出文件即可。

---

## 七、常见问题

### Q1: 如何调整推送时间?

修改 `.github/workflows/daily.yml` 中的 cron:
- 北京时间 09:00 = UTC 01:00 = `0 1 * * *`
- 北京时间 08:00 = UTC 00:00 = `0 0 * * *`
- 北京时间 18:00 = UTC 10:00 = `0 10 * * *`

⚠️ GitHub Actions 的 cron 触发可能延迟 5-15 分钟, 高峰时段更明显。如果对时间精确性要求高, 可以提前 15 分钟配置。

### Q2: 跑失败怎么排查?

进入 **Actions → AI Daily Report → 失败的运行 → 点 generate 步骤展开日志**, 常见错误:
- `ANTHROPIC_API_KEY` 没设/写错 → 重新设置 Secret
- `Anthropic API HTTP 401` → API Key 失效, 重新生成
- `Anthropic API HTTP 429` → 触发限流, 等会儿再跑
- `SMTP login failed` → Gmail 应用密码错了, 或者没启用两步验证
- `web_search_20250305` 不识别 → API Key 没开启 Web Search 权限, 联系 Anthropic 支持

### Q3: 想增加更多通道 (飞书/企微/Bark)?

在 `generate_report.py` 末尾的发送逻辑后, 加入对应通道的 webhook 调用。可以让我帮你加, 告诉我你要哪个通道。

### Q4: 不想要 LLMOps 专题, 只要综合版?

修改 workflow 里的 run 命令为:
```yaml
run: python3 generate_report.py --skip-llmops
```

---

## 八、维护建议

- **每月检查一次**: API Key 是否还在期, Gmail 应用密码是否有效
- **每季度检查一次**: 提示词模板是否需要更新 (新增关注的厂商/赛道)
- **关注 Actions 用量**: 每月 2000 分钟免费额度, 这个 workflow 每次约 2-5 分钟, 完全够用
