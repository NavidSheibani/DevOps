#!/bin/bash
TARGET_DIR="/var/log"
SIZE_LIMIT="+500M"

echo "Finding large files in $TARGET_DIR..."
find "$TARGET_DIR" -type f -size "$SIZE_LIMIT" -exec ls -lh {} \;

read -p "Delete these files? (y/n) " choice
if [[ $choice == "y" ]]; then
    find "$TARGET_DIR" -type f -size "$SIZE_LIMIT" -delete
    echo "Files deleted!"
else
    echo "Operation canceled."
fi


######
#Find files larger than 500MB in /var/log and delete them.
#NavidSheibani
######
