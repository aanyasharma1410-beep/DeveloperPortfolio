mkdir -p ShellScripts

cat << 'EOF' > ShellScripts/backup.sh
#!/bin/bash
# Author: Aanya Sharma (2601730310)
# Description: Creates a timestamped compressed backup archive of a folder and logs the result.

# 1. Check that a folder argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi

# Remove any trailing slash from the input path
SOURCE_FOLDER="${1%/}"

# 2. Check that the provided folder exists
if [ ! -d "$SOURCE_FOLDER" ]; then
    echo "Error: Folder '$SOURCE_FOLDER' does not exist."
    exit 1
fi

# 3. Create backup directory and timestamped .tar.gz archive
BACKUP_DIR="$HOME/DeveloperPortfolio_Backups"
mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="backup_${TIMESTAMP}.tar.gz"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILE"

tar -czf "$BACKUP_PATH" -C "$(dirname "$SOURCE_FOLDER")" "$(basename "$SOURCE_FOLDER")"

# 4 & 5. Print success message with filename and size, and append to backup.log
if [ $? -eq 0 ]; then
    FILE_SIZE=$(du -h "$BACKUP_PATH" | awk '{print $1}')
    echo "Backup created successfully: $BACKUP_FILE (Size: $FILE_SIZE)"
    echo "[$TIMESTAMP] SUCCESS: Backed up '$SOURCE_FOLDER' to $BACKUP_FILE ($FILE_SIZE)" >> "$BACKUP_DIR/backup.log"
else
    echo "Error: Backup failed for '$SOURCE_FOLDER'."
    echo "[$TIMESTAMP] FAILED: Backup failed for '$SOURCE_FOLDER'" >> "$BACKUP_DIR/backup.log"
    exit 1
fi
EOF
