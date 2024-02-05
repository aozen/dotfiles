#!/bin/bash

source ~/.dotfiles/.env
source ~/.dotfiles/helper.sh

echo_title "INSTALL VSCODE"

if command -v code &> /dev/null; then
    echo -e "${WARNING_COLOR}Visual Studio Code is already installed${NO_COLOR}"
    echo "$(code --version | awk 'NR==1{print $1}')"
    exit 0
fi

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - > /dev/null 2>&1

echo | sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /dev/null 2>&1

sudo apt update

sudo apt install code -y > /dev/null 2>&1

if command -v code &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Visual Studio Code installed successfully${NO_COLOR}"
    echo "$(code --version | awk 'NR==1{print $1}')"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Visual Studio Code${NO_COLOR}"
    exit 1
fi