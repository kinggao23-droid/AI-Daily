# AI Daily Report

This repository contains automated daily AI technology reports.

## Setup

1. Install dependencies (for local testing):
   ```bash
   pip install anthropic
   ```

2. Set environment variables (for local testing):
   - `ANTHROPIC_API_KEY`: Your Anthropic API key (ensure it's valid and has credits). Get from https://console.anthropic.com/
   - `EMAIL_USERNAME`: Your Gmail username (e.g., yourname@gmail.com)
   - `EMAIL_PASSWORD`: Your Gmail app password (not regular password). Generate at https://myaccount.google.com/apppasswords

   Set them in your shell:
   ```bash
   export ANTHROPIC_API_KEY="your_key_here"
   export EMAIL_USERNAME="your_email@gmail.com"
   export EMAIL_PASSWORD="your_app_password"
   ```

3. For GitHub Actions automation, set secrets in repository settings:
   - `ANTHROPIC_API_KEY`: Your Anthropic API key
   - `EMAIL_USERNAME`: Your Gmail username
   - `EMAIL_PASSWORD`: Your Gmail app password

4. The report is now automatically generated daily at 9 AM Beijing time (1 AM UTC) via GitHub Actions. No manual cron setup needed.

5. Test the script manually (optional):
   ```bash
   cd /path/to/repo
   export ANTHROPIC_API_KEY="your_key"
   export EMAIL_USERNAME="your_email"
   export EMAIL_PASSWORD="your_pass"
   python3 generate_report.py
   ```

## Troubleshooting

- **Reports stop generating**: Check API key validity, rate limits, and credits on Anthropic dashboard.
- **Cron not running**: Check cron logs: `grep CRON /var/log/syslog` or `journalctl -u cron`.
- **Network issues**: Ensure internet connectivity for API calls.
- **Email issues**: Verify Gmail app password and SMTP settings. Enable "Less secure app access" or use app passwords.
- **Git issues**: Ensure git is configured with user.name and user.email.
- **Run manually**: Test with `python generate_report.py` and check output.
- **Check logs**: Add logging to script for better debugging.

## Files

- `generate_report.py`: Sample script to generate report using Claude API, commit to repo, and send email.
- `.github/workflows/send-email.yml`: GitHub Action to send email on push.