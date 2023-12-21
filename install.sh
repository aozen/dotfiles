#!/bin/bash

echo -e "${SUCCESS_COLOR}❤️ Setting Up Started ❤️${NO_COLOR}\n"

# Load environment variables from .env file
source ./.env
source ./helper.sh

# Request sudo to use further
sudo -v

# Clone Dotfile
echo_title "CLONING DOTFILE"
if [ ! -d "$DOTFILES_PATH" ]; then
    mkdir -p "$DOTFILES_PATH"
    echo 'Cloning dotfiles repository'
    git clone --quiet "$DOTFILES_SSH_LINK" "$DOTFILES_PATH"
    echo -e "${SUCCESS_COLOR}Dotfiles repository cloned successfully${NO_COLOR}"
    cd $DOTFILES_PATH
    cp .env_example .env
else
    echo -e "${WARNING_COLOR}Dotfiles repository already exists at $DOTFILES_PATH${NO_COLOR}"
    cd $DOTFILES_PATH
fi

# Check env
if ! confirm "If you filled .env file continue. Otherwise we have a problem"; then
    echo -e "${ERROR_COLOR}Skipping Installation. Exiting... Fill .env and come back...${NO_COLOR}"
    exit 1
fi

# Install ZSH
echo_title "ZSH"
if ! command -v zsh &> /dev/null; then
    echo "ZSH is not installed. Installing ZSH"
    sudo apt install zsh -y &> /dev/null
    echo -e "${SUCCESS_COLOR}ZSH is installed${NO_COLOR}"
else
    echo -e "${WARNING_COLOR}ZSH is already installed${NO_COLOR}"
fi

# Install Oh-My-Zsh
echo_title "OH MY ZSH"
if [[ ! -d "$ZSH" && ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "OMZ is not installed. Installing OMZ"
    yes | /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)" > /dev/null 2>&1
    echo -e "${SUCCESS_COLOR}OMZ is installed${NO_COLOR}"
else
    echo -e "${WARNING_COLOR}OMZ is already installed${NO_COLOR}"
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

# Override .zshrc
echo_title ".ZSHRC"
if confirm "Do you want to overwrite .zshrc file?"; then
    cp ~/.zshrc /tmp/..zshrc
    rm -rf ~/.zshrc
    cp "$DOTFILES_PATH"/.zshrc ~/.zshrc
    echo -e "${SUCCESS_COLOR}.zshrc backup saved to /tmp/..zshrc${NO_COLOR}"
    echo -e "${SUCCESS_COLOR}.zshrc overwritten${NO_COLOR}"
else
    echo -e "${SUCCESS_COLOR}Skipping overwrite .zshrc${NO_COLOR}"
fi

# Create Folders
echo_title "CREATE HOME FOLDERS"
mkdir -p $HOME/Projects $HOME/Screenshots $HOME/Personal $HOME/Scripts $HOME/devTools $HOME/devManage $HOME/sqlBackups
echo -e "${SUCCESS_COLOR}Necessary folders are created${NO_COLOR}"

# Clone Projects
echo_title "CLONE PROJECTS"
chmod +x "$DOTFILES_PATH"/clone.sh
"$DOTFILES_PATH/clone.sh"

# Handle Fonts
echo_title "FONTS"
if ! [[ -d "$DOTFILES_PATH/fonts" ]]; then
    git clone --quiet https://github.com/powerline/fonts.git "$DOTFILES_PATH/fonts"
    echo -e "${SUCCESS_COLOR}Powerline fonts repository cloned successfully${NO_COLOR}"

    echo "Installing powerline fonts..."
    cd "$DOTFILES_PATH/fonts" || exit
    ./install.sh > /dev/null 2>&1
    cd - || exit
fi
echo -e "${SUCCESS_COLOR}Powerline fonts installed successfully${NO_COLOR}"

# Clone additional repositories and install dependencies if needed
# Example: git clone <REPO_URL> ~/Projects/lelele
# Example: cd ~/Projects/lelele && npm install

echo -e "\n${SUCCESS_COLOR}❤️ Installation completed successfully ❤️${NO_COLOR}"