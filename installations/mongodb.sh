#!/bin/bash
source ./.env
source ./helper.sh

if command -v mongod &> /dev/null; then
    echo -e "${WARNING_COLOR}MongoDB is already installed${NO_COLOR}"
    echo "Mongod version: $(mongod --version | awk '/db version/{print $3}')"
    echo "Mongosh version: $(mongosh --version)"
    exit 0
fi

sudo apt-get install gnupg curl > /dev/null 2>&1

curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/7.0 multiverse" | \
   sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list > /dev/null

sudo apt-get update > /dev/null 2>&1

sudo apt-get install -y mongodb-org > /dev/null 2>&1

if command -v mongod &> /dev/null; then
    echo -e "${SUCCESS_COLOR}MongoDB installed successfully${NO_COLOR}"
    echo "Mongod version: $(mongod --version | awk '/db version/{print $3}')"
    echo "Mongosh version: $(mongosh --version)"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install MongoDB${NO_COLOR}"
    exit 1
fi