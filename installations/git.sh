#!/bin/bash

source ~/.dotfiles/.env
source ~/.dotfiles/helper.sh

echo_title "INSTALL GIT"

if command -v git &> /dev/null; then
    echo -e "${WARNING_COLOR}Git is already installed${NO_COLOR}"
    echo "$(git --version)"
    exit 0
fi

sudo apt install git -y > /dev/null 2>&1

if command -v git &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Git installed successfully${NO_COLOR}"
    echo "$(git --version)"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Git${NO_COLOR}"
    exit 1
fi