# AI Daily Report

This repository contains automated daily AI technology reports.

## Setup

1. Install dependencies:
   ```bash
   pip install anthropic
   ```

2. Set environment variables:
   - `ANTHROPIC_API_KEY`: Your Anthropic API key
   - `EMAIL_USERNAME`: Your email username
   - `EMAIL_PASSWORD`: Your email password

3. For GitHub Actions email notification, set secrets in repository settings:
   - `EMAIL_USERNAME`
   - `EMAIL_PASSWORD`

4. Schedule the script to run daily at 9 AM using cron:
   ```bash
   crontab -e
   # Add: 0 9 * * * /path/to/generate_report.py
   ```

## Troubleshooting

- If reports stop generating, check API key validity and rate limits.
- Check cron logs: `grep CRON /var/log/syslog`
- Ensure network connectivity for API calls.
- For email issues, verify SMTP settings.

## Files

- `generate_report.py`: Sample script to generate report using Claude API, commit to repo, and send email.
- `.github/workflows/send-email.yml`: GitHub Action to send email on push.