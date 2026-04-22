import os
import subprocess
from datetime import datetime
import smtplib
from email.mime.text import MIMEText

# Configuration
EMAIL_USERNAME = os.getenv('EMAIL_USERNAME')
EMAIL_PASSWORD = os.getenv('EMAIL_PASSWORD')
RECIPIENT_EMAIL = 'kinggao23@gmail.com'

def generate_report():
    try:
        prompt = """
        Generate a daily AI technology report in Chinese, similar to previous reports.
        Include sections: 今日要闻, 热门开源项目, 产品动态, 趋势洞察与行动建议.
        Use current date and real/fictional but plausible AI news.
        Format as Markdown.
        """
        
        # Use Claude Code to generate the report
        result = subprocess.run(
            ['claude', prompt],
            capture_output=True,
            text=True,
            timeout=300  # 5 minutes timeout
        )
        
        if result.returncode == 0:
            report = result.stdout.strip()
        else:
            raise Exception(f"Claude Code failed: {result.stderr}")
        
        return report
    except subprocess.TimeoutExpired:
        raise Exception("Claude Code timed out")
    except FileNotFoundError:
        raise Exception("Claude command not found. Ensure Claude Code is installed and in PATH.")

def save_report(report):
    date = datetime.now().strftime('%Y-%m-%d')
    filename = f'{date}.md'
    with open(filename, 'w') as f:
        f.write(report)
    return filename

def commit_and_push(filename):
    try:
        subprocess.run(['git', 'add', filename], check=True)
        subprocess.run(['git', 'commit', '-m', f'daily: {datetime.now().strftime("%Y-%m-%d")} AI 技术日报'], check=True)
        subprocess.run(['git', 'push'], check=True)
    except subprocess.CalledProcessError as e:
        raise Exception(f"Git operation failed: {e}")

def send_email(subject, body):
    try:
        msg = MIMEText(body)
        msg['Subject'] = subject
        msg['From'] = EMAIL_USERNAME
        msg['To'] = RECIPIENT_EMAIL
        
        server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
        server.login(EMAIL_USERNAME, EMAIL_PASSWORD)
        server.sendmail(EMAIL_USERNAME, RECIPIENT_EMAIL, msg.as_string())
        server.quit()
    except Exception as e:
        print(f"Email send failed: {e}")
        # Don't raise exception to avoid stopping the process

if __name__ == '__main__':
    try:
        report = generate_report()
        filename = save_report(report)
        commit_and_push(filename)
        send_email('AI Daily Report Updated', f'New report generated: {filename}')
        print('Report generated and committed successfully.')
    except Exception as e:
        error_msg = f'Error: {e}'
        print(error_msg)
        send_email('AI Daily Report Generation Failed', error_msg)