#!/bin/bash
source ./.env
source ./helper.sh

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