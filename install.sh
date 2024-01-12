#!/bin/bash

echo -e "${SUCCESS_COLOR}❤️ Setting Up Started ❤️ ${NO_COLOR}\n"

# Load environment variables from .env file
source ./.env
source ./helper.sh

# Request sudo to use further
sudo -v

# Check env
if ! confirm "Are you in the $DOTFILES_PATH? Also if you filled .env file continue. Otherwise we have a problem"; then
    echo -e "${ERROR_COLOR}Skipping Installation. Exiting... Fill .env and come back...${NO_COLOR}"
    exit 1
fi

# Create Folders
echo_title "CREATE HOME FOLDERS"
mkdir -p $HOME/Projects $HOME/Screenshots $HOME/Personal $HOME/Scripts $HOME/devTools $HOME/devManage $HOME/sqlBackups $HOME/go
echo -e "${SUCCESS_COLOR}Necessary folders are created${NO_COLOR}"

# GIT
echo_title "INSTALL GIT"
chmod +x ./installations/git.sh && ./installations/git.sh

# Clone
echo_title "CLONE PROJECTS"
chmod +x ./clone.sh && ./clone.sh

# ZSH
chmod +x ./installations/zsh.sh && ./installations/zsh.sh

# ZSHRC
echo_title ".ZSHRC"
cp ~/.zshrc /tmp/_zshrc
echo -e "${SUCCESS_COLOR}.zshrc backup saved to /tmp/_zshrc${NO_COLOR}"
rm -rf ~/.zshrc
cp .zshrc ~/.zshrc
echo -e "${SUCCESS_COLOR}.zshrc overwritten${NO_COLOR}"

# DOCKER
echo_title "INSTALL DOCKER"
chmod +x ./installations/docker.sh && ./installations/docker.sh

# NODEJS & NPM
echo_title "INSTALL NODEJS & NPM"
chmod +x ./installations/nodejs.sh && ./installations/nodejs.sh

# MONGODB
echo_title "INSTALL MONGODB"
chmod +x ./installations/mongodb.sh && ./installations/mongodb.sh

# GO
echo_title "INSTALL GO"
chmod +x ./installations/go.sh && ./installations/go.sh

# VSCODE
echo_title "INSTALL VSCODE"
chmod +x ./installations/vscode.sh && ./installations/vscode.sh

# GUAKE
echo_title "INSTALL GUAKE"
chmod +x ./installations/guake.sh && ./installations/guake.sh

# POSTMAN
echo_title "INSTALL POSTMAN"
chmod +x ./installations/postman.sh && ./installations/postman.sh

# SLACK
echo_title "INSTALL SLACK"
chmod +x ./installations/slack.sh && ./installations/slack.sh

# DISCORD
echo_title "INSTALL DISCORD"
chmod +x ./installations/discord.sh && ./installations/discord.sh

# FONTS
echo_title "INSTALL FONTS"
chmod +x ./installations/font.sh && ./installations/font.sh

# Clone additional repositories and install dependencies if needed
# Example: git clone <REPO_URL> ~/Projects/lelele
# Example: cd ~/Projects/lelele && npm install

echo -e "\n${SUCCESS_COLOR}❤️ Installation completed successfully ❤️${NO_COLOR}"