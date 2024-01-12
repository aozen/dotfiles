#!/bin/bash
source ./.env
source ./helper.sh

echo_title "INSTALL FONTS"

if [[ -d "$DOTFILES_PATH/fonts" ]]; then
    echo -e "${WARNING_COLOR}Powerline fonts are already installed${NO_COLOR}"
    exit 0
fi

git clone --quiet https://github.com/powerline/fonts.git "$DOTFILES_PATH/fonts"
echo -e "${SUCCESS_COLOR}Powerline fonts repository cloned successfully${NO_COLOR}"

echo "Installing powerline fonts..."
cd "$DOTFILES_PATH/fonts" || exit
./install.sh > /dev/null 2>&1 #./fonts/install.sh (different install.sh)
cd - > /dev/null || exit

if [[ -d "$DOTFILES_PATH/fonts" ]]; then
    echo -e "${SUCCESS_COLOR}Powerline fonts installed successfully${NO_COLOR}"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Powerline fonts${NO_COLOR}"
    exit 1
fi