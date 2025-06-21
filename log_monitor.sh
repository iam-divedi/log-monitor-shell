#!/bin/bash

# Ye wo file hai jisme tu errors dhundega
LOG_FILE="/var/log/syslog"

# Ye keywords hain jinpe alert milega
KEYWORDS=("ERROR" "CRITICAL" "FAILURE")

# Jisme tu matched logs store karega
OUTPUT_LOG="./log_summary.txt"

# Alert log file
ALERT_LOG="./alert_triggered.txt"

echo "🟡 Starting Log Monitoring..."
echo "Scanning: $LOG_FILE"
echo "---------------------------------------------------"

# Har line read karte jao aur keyword se match karo
while read -r line; do
    for keyword in "${KEYWORDS[@]}"; do
        if echo "$line" | grep -q "$keyword"; then
            echo "$(date '+%Y-%m-%d %H:%M:%S') : $line" >> "$OUTPUT_LOG"
            echo "$(date '+%Y-%m-%d %H:%M:%S') : ALERT - $keyword found!" >> "$ALERT_LOG"
            echo "🚨 ALERT: $keyword found in logs!"
        fi
    done
done < "$LOG_FILE"

echo "✅ Scan completed. Check $OUTPUT_LOG and $ALERT_LOG for details."
