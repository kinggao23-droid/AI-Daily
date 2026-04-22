import os
import requests
from datetime import datetime
from anthropic import Anthropic
import subprocess
import smtplib
from email.mime.text import MIMEText

# Configuration
ANTHROPIC_API_KEY = os.getenv('ANTHROPIC_API_KEY')
EMAIL_USERNAME = os.getenv('EMAIL_USERNAME')
EMAIL_PASSWORD = os.getenv('EMAIL_PASSWORD')
RECIPIENT_EMAIL = 'your-email@example.com'

def generate_report():
    try:
        client = Anthropic(api_key=ANTHROPIC_API_KEY)
        
        prompt = """
        Generate a daily AI technology report in Chinese, similar to previous reports.
        Include sections: 今日要闻, 热门开源项目, 产品动态, 趋势洞察与行动建议.
        Use current date and real/fictional but plausible AI news.
        Format as Markdown.
        """
        
        response = client.messages.create(
            model="claude-3-opus-20240229",
            max_tokens=4000,
            messages=[{"role": "user", "content": prompt}]
        )
        
        report = response.content[0].text
        return report
    except Exception as e:
        raise Exception(f"Failed to generate report: {e}")

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