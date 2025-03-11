#!/bin/bash
LOG_DIR="/var/log"

echo "Clearing logs older than 7 days..."
find "$LOG_DIR" -type f -mtime +7 -exec rm -f {} \;
echo "Log cleanup completed!"


######
#This script clears logs older than 7 days.
#NavidSheibani
#####
