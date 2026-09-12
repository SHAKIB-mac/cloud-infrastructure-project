#!/bin/bash
echo "===========================================

         SYSTEM HEALTH REPORT

==========================================="


echo "Hostname: $(hostname)"
echo "Uptime:  $(uptime)"


cpu=$(top -bn1 | awk '/Cpu\(s\)/ {print int( 100 - $8)}')
echo "CPU Usage: ${cpu}%"

memory=$(free | grep Mem | awk '{print int( $3/$2 * 100)}')
echo  "Memory Usage: ${memory}%"



disk=$(df -h / | tail -1 | awk '{print  $5}' | tr -d '%')
echo "Disk Usage: ${disk}%"

echo "IP Address: $(hostname -I)"



echo "=========================="
echo "Status:"
if [ "$cpu" -lt 10 ] && [ "$memory" -lt 80 ] && [ "$disk" -lt 80 ];  then
    echo "HEALTHY"
else 
    echo "WARNING"
fi
echo "========================="
