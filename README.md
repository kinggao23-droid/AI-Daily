# AI Daily Report

This repository contains automated daily AI technology reports.

## Setup

1. Install dependencies (for local testing):
   ```bash
   # No Python dependencies needed, but ensure Claude Code is installed
   ```

2. Ensure Claude Code is installed and authenticated:
   - Install Claude Code: Follow instructions at https://docs.anthropic.com/claude/docs/claude-code
   - Authenticate with your Claude Max account.

3. For GitHub Actions automation, ensure the runner has Claude Code installed (may require custom setup).

4. For email notification, set secrets in repository settings:
   - `EMAIL_USERNAME`: Your Gmail username
   - `EMAIL_PASSWORD`: Your Gmail app password

5. The report is now automatically generated daily at 9 AM Beijing time (1 AM UTC) via GitHub Actions using Claude Code.

6. Test the script manually (optional):
   ```bash
   cd /path/to/repo
   export EMAIL_USERNAME="your_email"
   export EMAIL_PASSWORD="your_pass"
   python3 generate_report.py
   ```

## Troubleshooting

- **Reports stop generating**: Check if Claude Code is installed and authenticated. Ensure your Claude Max permissions are active.
- **Claude command not found**: Install Claude Code and add to PATH.
- **Network issues**: Ensure internet connectivity for Claude Code to work.
- **Email issues**: Verify Gmail app password and SMTP settings.
- **Git issues**: Ensure git is configured with user.name and user.email.
- **Run manually**: Test with `python generate_report.py` and check output.
- **Check logs**: Add logging to script for better debugging.

## Files

- `generate_report.py`: Sample script to generate report using Claude API, commit to repo, and send email.
- `.github/workflows/send-email.yml`: GitHub Action to send email on push.