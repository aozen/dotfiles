#!/bin/bash
source ./.env
source ./helper.sh

# Zsh
echo_title "INSTALL ZSH"
if ! command -v zsh &> /dev/null; then
    echo "ZSH is not installed. Installing ZSH"
    sudo apt install zsh -y &> /dev/null
    echo -e "${SUCCESS_COLOR}ZSH is installed${NO_COLOR}"
else
    echo -e "${WARNING_COLOR}ZSH is already installed${NO_COLOR}"
fi
echo "$(zsh --version)"

# Oh-My-Zsh
echo_title "INSTALL Oh-My-Zsh"
if [[ -d "$ZSH" || -d "$HOME/.oh-my-zsh" ]]; then
    echo -e "${WARNING_COLOR}Oh-My-Zsh is already installed${NO_COLOR}"
else
    echo "Installing OMZ..."
    yes | /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)" > /dev/null 2>&1
    echo -e "${SUCCESS_COLOR}OMZ is installed${NO_COLOR}"
fi

# Clone zsh-autosuggestions plugin
echo_title "ZSH AUTO SUGGESTION"
if ! [[ -d "$DOTFILES_PATH/plugins/zsh-autosuggestions" ]]; then
    git clone --quiet https://github.com/zsh-users/zsh-autosuggestions "$DOTFILES_PATH/plugins/zsh-autosuggestions"
    echo -e "${SUCCESS_COLOR}zsh-autosuggestions plugin cloned successfully${NO_COLOR}"
else
    echo -e "${WARNING_COLOR}zsh-autosuggestions is already installed${NO_COLOR}"
fi

# Clone zsh-syntax-highlighting plugin
echo_title "ZSH SYNTAX HIGHLIGHTING"
if ! [[ -d "$DOTFILES_PATH/plugins/zsh-syntax-highlighting" ]]; then
    git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git "$DOTFILES_PATH/plugins/zsh-syntax-highlighting"
    echo -e "${SUCCESS_COLOR}zsh-syntax-highlighting plugin cloned successfully${NO_COLOR}"
else
    echo -e "${WARNING_COLOR}zsh-syntax-highlighting is already installed${NO_COLOR}"
fi

# ZSHRC
echo_title ".ZSHRC"
cp ~/.zshrc /tmp/_zshrc
echo -e "${SUCCESS_COLOR}.zshrc backup saved to /tmp/_zshrc${NO_COLOR}"
rm -rf ~/.zshrc
cp .zshrc ~/.zshrc
echo -e "${SUCCESS_COLOR}.zshrc overwritten${NO_COLOR}"