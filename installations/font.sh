#!/bin/bash

source ~/.dotfiles/.env
source ~/.dotfiles/helper.sh

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

# -----------------------------
# INSTALL POWERLINE FONTS
# -----------------------------
echo_title "INSTALL POWERLINE FONTS"

if fc-list | grep -iq "Powerline"; then
    echo -e "${WARNING_COLOR}Powerline fonts are already installed${NO_COLOR}"
else
    git clone --quiet https://github.com/powerline/fonts.git "$HOME/.dotfiles/fonts"
    echo -e "${SUCCESS_COLOR}Powerline fonts repository cloned successfully${NO_COLOR}"

    echo "Installing powerline fonts..."
    cd "$HOME/.dotfiles/fonts" || exit
    ./install.sh > /dev/null 2>&1
    cd - > /dev/null || exit

    if fc-list | grep -iq "Powerline"; then
        echo -e "${SUCCESS_COLOR}Powerline fonts installed successfully${NO_COLOR}"
    else
        echo -e "${ERROR_COLOR}Failed to install Powerline fonts${NO_COLOR}"
    fi
fi

# -----------------------------
# INSTALL FIRA CODE NERD FONT
# -----------------------------
echo_title "INSTALL FIRA CODE NERD FONT"

if fc-list | grep -iq "FiraCode Nerd Font"; then
    echo -e "${WARNING_COLOR}FiraCode Nerd Font already installed${NO_COLOR}"
else
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip -O /tmp/FiraCode.zip

    unzip -o /tmp/FiraCode.zip -d "$FONT_DIR" > /dev/null 2>&1
    fc-cache -fv > /dev/null 2>&1

    if fc-list | grep -iq "FiraCode Nerd Font"; then
        echo -e "${SUCCESS_COLOR}FiraCode Nerd Font installed${NO_COLOR}"
    else
        echo -e "${ERROR_COLOR}Failed to install FiraCode Nerd Font${NO_COLOR}"
    fi
fi

exit 0
