#!/bin/bash

# Usage: ./restore.sh <backup_file>
if [ -z "$1" ]; then
    echo "Usage: $0 <backup_file>"
    exit 1
fi

BACKUP_FILE=$1
DB_NAME="project_db"

# Drop and recreate the database
sudo psql -U postgres -c "DROP DATABASE IF EXISTS $DB_NAME;"
sudo psql -U postgres -c "CREATE DATABASE $DB_NAME;"

# Restore the backup
pg_restore -U postgres -d $DB_NAME "$BACKUP_FILE"

echo "Database restored from $BACKUP_FILE"