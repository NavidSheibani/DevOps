#!/bin/bash
BACKUP_DIR="/mnt/backup"
DATE=$(date +%Y%m%d)
BACKUP_FILE="$BACKUP_DIR/home_backup_$DATE.tar.gz"

echo "Creating backup..."
tar -czf "$BACKUP_FILE" /home/$USER

echo "Backup saved to $BACKUP_FILE"

######
#Creates a compressed backup of your home folder.
#NavidSheibani
######
