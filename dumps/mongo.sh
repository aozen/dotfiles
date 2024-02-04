# #!/bin/bash

source ./.env
source ./helper.sh

echo_title "MONGODB DATABASE BACKUP"

if ! mongosh --username "$MONGODB_USER" --password "$MONGODB_PASSWORD" --authenticationDatabase "admin" --eval "db.adminCommand('listDatabases')" > /dev/null 2>&1; then
    echo -e "${ERROR_COLOR}Failed to connect to MongoDB. Check your MongoDB server or credentials.${NO_COLOR}"
    exit 1
else
    echo -e "${SUCCESS_COLOR}Connected to MongoDB successfully${NO_COLOR}"
fi

DATE=$(date +"%d-%m-%Y")
BACKUP_DIR="$HOME/Backups/mongo"

for DB in "${MONGODB_DATABASES[@]}"; do
    mkdir -p "$BACKUP_DIR/$DATE"

    if mongodump --username "$MONGODB_USER" --password "$MONGODB_PASSWORD" --authenticationDatabase "admin" --db "$DB" --out "$BACKUP_DIR/$DATE" > /dev/null 2>&1; then
        echo -e "${TITLE_COLOR}Backup of $DB completed successfully${NO_COLOR}"
    else
        echo -e "${ERROR_COLOR}Failed to backup $DB${NO_COLOR}"
        exit 1
    fi
done

echo -e "${SUCCESS_COLOR}All databases backed up successfully${NO_COLOR}"
