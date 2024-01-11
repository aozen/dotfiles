#!/bin/bash
source ./.env
source ./helper.sh

if command -v node &> /dev/null; then
    echo -e "${WARNING_COLOR}Node.js is already installed${NO_COLOR}"
else
    echo "Installing Node.js..."
    sudo apt install nodejs -y > /dev/null 2>&1
    echo -e "${SUCCESS_COLOR}Node.js installed successfully${NO_COLOR}"
fi

if command -v npm &> /dev/null; then
    echo -e "${WARNING_COLOR}npm is already installed${NO_COLOR}"
else
    echo "Installing npm..."
    sudo apt install npm -y > /dev/null 2>&1
    echo -e "${SUCCESS_COLOR}npm installed successfully${NO_COLOR}"
fi

sudo npm cache clean -f > /dev/null 2>&1
sudo npm install -g n > /dev/null 2>&1
sudo n stable > /dev/null 2>&1

echo "Node.js version: $(node -v)"
echo "npm version: $(npm -v)"