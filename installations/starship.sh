#!/bin/bash

source ~/.dotfiles/.env
source ~/.dotfiles/helper.sh

echo_title "INSTALL STARSHIP"

INSTALL_DONE=false

if command -v starship &> /dev/null; then
    echo -e "${WARNING_COLOR}Starship is already installed${NO_COLOR}"
    echo "Starship version: $(starship --version | awk '/starship/{print $2}')"
else
    sh -c "$(curl -fsSL https://starship.rs/install.sh)" -y -f &> /dev/null

    if command -v starship &> /dev/null; then
        echo -e "${SUCCESS_COLOR}Starship installed successfully${NO_COLOR}"
        echo "Starship Version: $(starship --version | awk '/starship/{print $2}')"
        INSTALL_DONE=true
    else
        echo -e "${ERROR_COLOR}Failed to install Starship${NO_COLOR}"
        exit 1
    fi
fi

# -----------------------------
# COPY STARSHIP CONFIG
# -----------------------------
echo_title "CONFIGURE STARSHIP"

CONFIG_DIR="$HOME/.config"
mkdir -p "$CONFIG_DIR"

if [[ -f "$HOME/.dotfiles/config/starship.toml" ]]; then
    cp "$HOME/.dotfiles/config/starship.toml" "$CONFIG_DIR/starship.toml"
    echo -e "${SUCCESS_COLOR}Starship config copied to ~/.config/starship.toml${NO_COLOR}"
else
    echo -e "${WARNING_COLOR}starship.toml not found in dotfiles repo${NO_COLOR}"
fi

exit 0
