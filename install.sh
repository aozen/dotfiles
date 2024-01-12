#!/bin/bash

echo -e "${SUCCESS_COLOR}❤️ Setting Up Started ❤️${NO_COLOR}\n"

# Load environment variables from .env file
source ./.env
source ./helper.sh

# Request sudo to use further
sudo -v

cd $DOTFILES_PATH

# Install GIT
echo_title "INSTALL GIT"
chmod +x "$DOTFILES_PATH"/installations/git.sh
"$DOTFILES_PATH/installations/git.sh"

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
chmod +x "$DOTFILES_PATH"/installations/zsh.sh
"$DOTFILES_PATH/installations/zsh.sh"

# Install Oh-My-Zsh
echo_title "OH MY ZSH"
chmod +x "$DOTFILES_PATH"/installations/oh-my-zsh.sh
"$DOTFILES_PATH/installations/oh-my-zsh.sh"

# Zsh Plugins
chmod +x "$DOTFILES_PATH"/installations/zsh-plugins.sh
"$DOTFILES_PATH/installations/zsh-plugins.sh"

# Override .zshrc
echo_title ".ZSHRC"
cp ~/.zshrc /tmp/_zshrc
echo -e "${SUCCESS_COLOR}.zshrc backup saved to /tmp/_zshrc${NO_COLOR}"
rm -rf ~/.zshrc
cp "$DOTFILES_PATH"/.zshrc ~/.zshrc
echo -e "${SUCCESS_COLOR}.zshrc overwritten${NO_COLOR}"

# Create Folders
echo_title "CREATE HOME FOLDERS"
mkdir -p $HOME/Projects $HOME/Screenshots $HOME/Personal $HOME/Scripts $HOME/devTools $HOME/devManage $HOME/sqlBackups $HOME/go
echo -e "${SUCCESS_COLOR}Necessary folders are created${NO_COLOR}"

# Clone Projects
echo_title "CLONE PROJECTS"
chmod +x "$DOTFILES_PATH"/clone.sh
"$DOTFILES_PATH/clone.sh"

# Install Go
echo_title "INSTALL GO"
chmod +x "$DOTFILES_PATH"/installations/go.sh
"$DOTFILES_PATH/installations/go.sh"

# Install Docker
echo_title "INSTALL DOCKER"
chmod +x "$DOTFILES_PATH"/installations/docker.sh
"$DOTFILES_PATH/installations/docker.sh"

# Install Nodejs & Npm
echo_title "INSTALL NODEJS & NPM"
chmod +x "$DOTFILES_PATH"/installations/nodejs.sh
"$DOTFILES_PATH/installations/nodejs.sh"

# Install MongoDB
echo_title "INSTALL MONGODB"
chmod +x "$DOTFILES_PATH"/installations/mongodb.sh
"$DOTFILES_PATH/installations/mongodb.sh"

echo_title "INSTALL GUAKE"
chmod +x "$DOTFILES_PATH"/installations/guake.sh
"$DOTFILES_PATH/installations/guake.sh"

echo_title "INSTALL POSTMAN"
chmod +x "$DOTFILES_PATH"/installations/postman.sh
"$DOTFILES_PATH/installations/postman.sh"

echo_title "VSCODE"
chmod +x "$DOTFILES_PATH"/installations/vscode.sh
"$DOTFILES_PATH/installations/vscode.sh"

# Handle Fonts
echo_title "FONTS"
chmod +x "$DOTFILES_PATH"/installations/font.sh
"$DOTFILES_PATH/installations/font.sh"

# Clone additional repositories and install dependencies if needed
# Example: git clone <REPO_URL> ~/Projects/lelele
# Example: cd ~/Projects/lelele && npm install

echo -e "\n${SUCCESS_COLOR}❤️ Installation completed successfully ❤️${NO_COLOR}"