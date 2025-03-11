#!/bin/bash
echo "Monitoring system resources (Press Ctrl+C to stop)..."
while true; do
    echo "-----------------------------"
    echo "CPU Load: $(top -bn1 | grep "load average" | awk '{print $10,$11,$12}')"
    echo "Memory Usage: $(free -h | awk '/Mem/ {print $3 "/" $2}')"
    echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 "/" $2}')"
    echo "-----------------------------"
    sleep 5
done

######
#This script continuously monitors CPU, memory, and disk usage.
#NavidSheibani
######
