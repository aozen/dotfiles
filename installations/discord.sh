#!/bin/bash

source ~/.dotfiles/.env
source ~/.dotfiles/helper.sh

echo_title "INSTALL DISCORD"

if command -v discord &> /dev/null; then
    echo -e "${WARNING_COLOR}Discord is already installed${NO_COLOR}"
    echo "Discord Version: $(snap info discord | grep installed | awk '{print $2}')"
    exit 0
fi

sudo snap install discord > /dev/null 2>&1

if command -v discord &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Discord installed successfully${NO_COLOR}"
    echo "Discord Version: $(snap info discord | grep installed | awk '{print $2}')"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Discord${NO_COLOR}"
    exit 1
fi