#!/bin/bash

echo -e "${SUCCESS_COLOR}❤️ Setting Up Started ❤️ ${NO_COLOR}\n"

# Load environment variables from .env file
source ~/.dotfiles/.env
source ~/.dotfiles/helper.sh

# Request sudo to use further
sudo -v

# Check env
if ! confirm "Are you in the ~/.dotfiles? Also if you filled .env file continue. Otherwise we have a problem"; then
    echo -e "${ERROR_COLOR}Skipping Installation. Exiting... Fill .env and come back...${NO_COLOR}"
    exit 1
fi

# Create Folders
echo_title "CREATE HOME FOLDERS"
mkdir -p $HOME/Projects $HOME/Screenshots $HOME/Personal $HOME/Scripts $HOME/devTools $HOME/devManage $HOME/Backups $HOME/go
echo -e "${SUCCESS_COLOR}Necessary folders are created${NO_COLOR}"

# Install main necessary packages
sudo apt-get install ca-certificates curl gnupg gpg lsb-release software-properties-common apt-transport-https wget > /dev/null

# Database Backup
chmod +x ./dumps/mysql.sh && ./dumps/mysql.sh
chmod +x ./dumps/mongo.sh && ./dumps/mongo.sh

# GIT
chmod +x ./installations/git.sh && ./installations/git.sh

# Clone
chmod +x ./clone.sh && ./clone.sh

# ZSH
chmod +x ./installations/zsh.sh && ./installations/zsh.sh

# DOCKER
chmod +x ./installations/docker.sh && ./installations/docker.sh

# REDIS
chmod +x ./installations/redis.sh && ./installations/redis.sh

# NODEJS & NPM
chmod +x ./installations/nodejs.sh && ./installations/nodejs.sh

# MONGODB
chmod +x ./installations/mongodb.sh && ./installations/mongodb.sh

# GO
chmod +x ./installations/go.sh && ./installations/go.sh

# VSCODE
chmod +x ./installations/vscode.sh && ./installations/vscode.sh

# GOOGLE CHROME
chmod +x ./installations/chrome.sh && ./installations/chrome.sh

# GUAKE
chmod +x ./installations/guake.sh && ./installations/guake.sh

# POSTMAN
chmod +x ./installations/postman.sh && ./installations/postman.sh

# SLACK
chmod +x ./installations/slack.sh && ./installations/slack.sh

# DISCORD
chmod +x ./installations/discord.sh && ./installations/discord.sh

# FONTS
chmod +x ./installations/font.sh && ./installations/font.sh

# Clone additional repositories and install dependencies if needed
# Example: git clone <REPO_URL> ~/Projects/lelele
# Example: cd ~/Projects/lelele && npm install

echo -e "\n${SUCCESS_COLOR}❤️ Installation completed successfully ❤️${NO_COLOR}"