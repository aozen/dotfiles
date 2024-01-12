#!/bin/bash
source ./.env
source ./helper.sh

echo_title "INSTALL SLACK"

if command -v slack &> /dev/null; then
    echo -e "${WARNING_COLOR}Slack is already installed${NO_COLOR}"
    echo "Slack Version: $(snap info slack | grep installed | awk '{print $2}')"
    exit 0
fi

sudo snap install slack > /dev/null 2>&1

if command -v slack &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Slack installed successfully${NO_COLOR}"
    echo "Slack Version: $(snap info slack | grep installed | awk '{print $2}')"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Slack${NO_COLOR}"
    exit 1
fi