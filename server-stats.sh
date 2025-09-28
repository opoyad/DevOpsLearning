#!/bin/bash
#
# server-stats.sh
# Basic server performance analysis script
#

echo "================= SERVER PERFORMANCE STATS ================="
echo "Generated on: $(date)"
echo "-------------------------------------------------------------"

# OS version
echo "OS Version:"
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "$PRETTY_NAME"
else
    uname -a
fi
echo

# Uptime and load average
echo "Uptime and Load Average:"
uptime
echo

# Logged-in users
echo "Logged in users:"
who
echo

# CPU usage
echo "CPU Usage:"
mpstat 1 1 | awk '/Average/ && $12 ~ /[0-9.]+/ {print 100 - $12"% used ("$12"% idle)"}'
echo

# Memory usage
echo "Memory Usage:"
free -h | awk 'NR==1{print $0} NR==2{printf "Total: %s | Used: %s | Free: %s | Usage: %.2f%%\n", $2, $3, $4, $3*100/$2 }'
echo

# Disk usage
echo "Disk Usage:"
df -h --total | awk '/total/ {printf "Total: %s | Used: %s | Avail: %s | Usage: %s\n", $2, $3, $4, $5}'
echo

# Top 5 processes by CPU
echo "Top 5 Processes by CPU usage:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo

# Top 5 processes by Memory
echo "Top 5 Processes by Memory usage:"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6
echo

# Stretch goal: Failed login attempts (if logs available)
if [ -f /var/log/auth.log ]; then
    echo "Recent Failed Login Attempts:"
    grep "Failed password" /var/log/auth.log | tail -n 5
elif [ -f /var/log/secure ]; then
    echo "Recent Failed Login Attempts:"
    grep "Failed password" /var/log/secure | tail -n 5
else
    echo "Failed login logs not found (checked auth.log and secure)."
fi
echo "============================================================="
