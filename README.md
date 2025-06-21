# 🔍 Log Monitor & Alert Automation (Shell Script)

A basic shell script to monitor Linux system log files, detect critical errors, and generate alerts. Useful for demonstrating automation, log analysis, and scripting fundamentals.

## 📁 Features
- Scans `/var/log/syslog` for keywords like `ERROR`, `CRITICAL`, and `FAILURE`
- Saves results in summary and alert logs
- Simulated alert output for fast debugging
- Cron-job ready for scheduled automation

## 🛠️ Tech Stack
- Bash (Shell Scripting)
- grep, date, redirection
- Linux log files
- Git & GitHub (for version control)

## 🚀 How to Run
```bash
chmod +x log_monitor.sh
./log_monitor.sh
