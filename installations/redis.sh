#!/bin/bash
source ./.env
source ./helper.sh

echo_title "INSTALL REDIS"

if command -v redis-server &> /dev/null; then
    echo -e "${WARNING_COLOR}Redis is already installed${NO_COLOR}"
    echo "$(redis-server --version)"
    exit 0
fi

sudo apt install lsb-release curl gpg -y > /dev/null 2>&1

curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg > /dev/null 2>&1

echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | \
   sudo tee /etc/apt/sources.list.d/redis.list > /dev/null

sudo apt-get install redis -y > /dev/null 2>&1

if command -v redis-server &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Redis installed successfully${NO_COLOR}"
    echo "$(redis-server --version)"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Redis${NO_COLOR}"
    exit 1
fi
