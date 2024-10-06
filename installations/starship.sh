#!/bin/bash

source ~/.dotfiles/.env
source ~/.dotfiles/helper.sh

echo_title "INSTALL STARSHIP"

if command -v starship &> /dev/null; then
    echo -e "${WARNING_COLOR}Starship is already installed${NO_COLOR}"
    echo "Starship version: $(starship --version | awk '/starship/{print $2}')"
    exit 0
fi

sh -c "$(curl -fsSL https://starship.rs/install.sh)" -y -f &> /dev/null

if command -v starship &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Starship installed successfully${NO_COLOR}"
    echo "Starship Version: $(starship --version | awk '/starship/{print $2}')"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Starship${NO_COLOR}"
    exit 1
fi