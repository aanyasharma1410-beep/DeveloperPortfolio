#!/bin/bash
# Author: Aanya Sharma (2601730310)
# Description: Creates a timestamped compressed backup archive and logs the result.

if [  $# -lt 1 ]; then
   echo "Usage: ./backup.sh <folder>"
   exit 1

fi

SOURCE_FOLDER="${1%/}"

if [ ! -d "$SOURCE_FOLDER" ]; then
    echo "Error: Folder '$SOURCE_FOLDER' does not exist."
    exit 1

fi

BACKUP_DIR="$HOME/DeveloperPortfolio_Backups"
mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="backup_${TIMESTAMP}.tar.gz"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILE"

tar -czf "$BACKUP_PATH" -C "$(dirname '$SOURCE_FOLDER')" "$(basename '$SOURCE_FOLDER')"

if [ $? -eq 0 ]; then
     FILE_SIZE=$(du -h "$BACKUP_PATH" | awk '{print $1}')
     echo "Backup created successfully: $BACKUP_FILE (Size: $FILE_SIZE)"
     echo "[$TIMESTAMP] SUCCESS: Backed up '$SOURCE_FOLDER' TO $BACK_FILE ($FILE_SIZE)" >> "$BACKUP_DIR/backup.log"
else
     echo "Error: Backup failed for '$SOURCE_FOLDER' ."
     echo  "[$IMESTAMP] FAILED : Backup failed for '$SOURCE_FOLDER'" >> "$BACKUP_DIR/backup.log"
     exit 1
 fi
