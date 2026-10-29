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
[ -n "${TEST_CPU:-}" ] && cpu="$TEST_CPU"
echo "CPU Usage: ${cpu}%"
memory=$(free | awk '/Mem:/ {printf "%.0f", ($2-$7)/$2*100}')
[ -n "${TEST_MEMORY:-}" ] && memory="$TEST_MEMORY"
echo  "Memory Usage: ${memory}%"



disk=$(df -h / | tail -1 | awk '{print  $5}' | tr -d '%')
[ -n "${TEST_DISK:-}" ] && disk="$TEST_DISK"
echo "Disk Usage: ${disk}%"

ip_address=$(ip -4 route show default | awk '{for (i=1; i<=NF; i++) if ($i=="src") {print $(i+1); exit}}')
echo "IP Address: ${ip_address}"

echo "=========================="

echo "Status:"

status=0

if [ "$cpu" -ge 80 ]; then
    echo "WARNING: High CPU usage (${cpu}%)"
    status=1
fi

if [ "$memory" -ge 80 ]; then
    echo "WARNING: High memory usage (${memory}%)"
    status=1
fi

if [ "$disk" -ge 80 ]; then
    echo "WARNING: High disk usage (${disk}%)"
    status=1
fi

if [ "$status" -eq 0 ]; then
    echo "HEALTHY"
fi
echo "========================="

exit "$status"
