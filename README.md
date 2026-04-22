# AI Daily Report

This repository contains automated daily AI technology reports.

## Setup

1. Install dependencies:
   ```bash
   pip install anthropic
   ```

2. Set environment variables:
   - `ANTHROPIC_API_KEY`: Your Anthropic API key (ensure it's valid and has credits)
   - `EMAIL_USERNAME`: Your Gmail username
   - `EMAIL_PASSWORD`: Your Gmail app password (not regular password)

3. For GitHub Actions email notification, set secrets in repository settings:
   - `EMAIL_USERNAME`
   - `EMAIL_PASSWORD`
   - Update `RECIPIENT_EMAIL` in scripts to your email

4. Schedule the script to run daily at 9 AM using cron:
   ```bash
   crontab -e
   # Add: 0 9 * * * cd /path/to/repo && /path/to/python generate_report.py
   ```

5. Test the script manually:
   ```bash
   python generate_report.py
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