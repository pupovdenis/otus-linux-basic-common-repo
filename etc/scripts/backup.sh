#!/bin/bash

# Backup directory
BACKUP_DIR="/var/backups/postgresql"
DATE=$(date +"%Y%m%d_%H%M%S")
FILENAME="project_db_backup_$DATE.sql"

# Create the backup directory if it doesn't exist
sudo mkdir -p $BACKUP_DIR

# Dump the database
sudo pg_dump -U postgres -F c -b -v -f "$BACKUP_DIR/$FILENAME" project_db

# Remove backups older than 7 days
sudo find $BACKUP_DIR -type f -mtime +7 -name "*.sql" -exec rm {} \;

echo "Backup completed and stored at $BACKUP_DIR/$FILENAME"