#!/bin/bash

# Variables
LOCAL_BACKUP_DIR="$1"
EXTERNAL_BACKUP_DIR="$2"
DB_NAME="$3"
DB_USER="$4"
SHELL_USER=`whoami`
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$LOCAL_BACKUP_DIR/odoo_db_${TIMESTAMP}.dump"

# Step 1: Perform Local Backup
sudo -u postgres pg_dump -U $DB_USER -F c -b -v -f "$BACKUP_FILE" $DB_NAME

# Check if backup succeeded
if [ $? -eq 0 ]; then
    echo "Backup completed: $BACKUP_FILE"

    # Step 2: Copy Backup to External SSD
    sudo cp "$BACKUP_FILE" "$EXTERNAL_BACKUP_DIR/"
    if [ $? -eq 0 ]; then
        echo "Backup successfully copied to $EXTERNAL_BACKUP_DIR"
        
        # Optionally, adjust ownership to david
        sudo chown "$SHELL_USER":"$SHELL_USER" "$EXTERNAL_BACKUP_DIR/$(basename "$BACKUP_FILE")"
    else
        echo "Failed to copy backup to external SSD."
        exit 2
    fi
else
    echo "Backup failed!"
    exit 1
fi
