#!/bin/bash

source ~/.dotfiles/.env
source ~/.dotfiles/helper.sh

echo_title "INSTALL POSTMAN"

if command -v postman &> /dev/null; then
    echo -e "${WARNING_COLOR}Postman is already installed${NO_COLOR}"
    echo "Postman Version: $(snap info postman | grep installed | awk '{print $2}')"
    exit 0
fi

sudo snap install postman > /dev/null 2>&1

if command -v postman &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Postman installed successfully${NO_COLOR}"
    echo "Postman Version: $(snap info postman | grep installed | awk '{print $2}')"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Postman${NO_COLOR}"
    exit 1
fi