#!/bin/bash
source ./.env
source ./helper.sh

if [[ -d "$ZSH" || -d "$HOME/.oh-my-zsh" ]]; then
    echo -e "${WARNING_COLOR}Oh-My-Zsh is already installed${NO_COLOR}"
    exit 0
fi

echo "Installing OMZ..."
yes | /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)" > /dev/null 2>&1
echo -e "${SUCCESS_COLOR}OMZ is installed${NO_COLOR}"