#!/bin/bash

source ./.env
source ./helper.sh

echo_title "MYSQL DATABASE BACKUP"

if ! mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "show databases;" > /dev/null 2>&1; then
    echo -e "${ERROR_COLOR}Failed to connect to MySQL. Check your credentials.${NO_COLOR}"
    exit 1
else
    echo -e "${SUCCESS_COLOR}Connected to MySQL successfully${NO_COLOR}"
fi

DATE=$(date +"%d-%m-%Y")
BACKUP_DIR="$HOME/Backups/mysql"

for DB in "${MYSQL_DATABASES[@]}"; do
    mkdir -p "$BACKUP_DIR/$DATE"

    if mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DB" > "$BACKUP_DIR/$DATE/$DB.sql"; then
        echo -e "${TITLE_COLOR}Backup of $DB completed successfully${NO_COLOR}"
    else
        echo -e "${ERROR_COLOR}Failed to backup $DB${NO_COLOR}"
        exit 1
    fi
done

echo -e "${SUCCESS_COLOR}All databases backed up successfully${NO_COLOR}"