#!/bin/bash

source ~/.dotfiles/.env
source ~/.dotfiles/helper.sh

echo_title "INSTALL FONTS"

if dpkg -s fonts-powerline &> /dev/null; then
    echo -e "${WARNING_COLOR}Powerline fonts are already installed${NO_COLOR}"
    exit 0
fi

sudo apt-get install fonts-powerline -y > /dev/null 2>&1

# Verify installation
if dpkg -s fonts-powerline &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Powerline fonts installed successfully${NO_COLOR}"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Powerline fonts${NO_COLOR}"
    exit 1
fi