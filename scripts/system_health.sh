#!/bin/bash
echo "===========================================

         SYSTEM HEALTH REPORT

==========================================="

echo "Report Time: $(date '+%Y-%m-%d %H:%M:%S %Z')"
echo "Hostname: $(hostname)"
echo "Uptime:  $(uptime)"


cpu=$(top -bn1 | awk -F'[, ]+' '/Cpu\(s\)/ {
    for (i=1; i<NF; i++) {
       if  ($i == "id") {
            print int(100 - $(i-1))
            exit
       }
    }
}')
echo "CPU Usage: ${cpu}%"
memory=$(free | awk '/Mem:/ {printf "%.0f", ($2-$7)/$2*100}')
echo  "Memory Usage: ${memory}%"



disk=$(df -h / | tail -1 | awk '{print  $5}' | tr -d '%')
echo "Disk Usage: ${disk}%"

ip_address=$(ip -4 route get 1.1.1.1 | awk '{for (i=1; i<=NF; i++) if ($i=="src") {print $(i+1); exit}}')
echo "IP Address: ${ip_address}"

echo "=========================="
echo "Status:"
if [ "$cpu" -ge 80 ]; then
    echo "WARNING: High CPU usage (${cpu}%)"
elif [ "$memory" -ge 80 ]; then
    echo "WARNING: High memory usage (${memory}%)"
elif [ "$disk" -ge 80 ]; then
    echo "WARNING: High disk usage (${disk}%)"
else 
    echo "HEALTHY"
fi
echo "========================="
