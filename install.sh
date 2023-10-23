#!/bin/bash

# Colors for terminal output
SUCCESS_COLOR='\033[0;32m'
ERROR_COLOR='\033[0;31m'
NO_COLOR='\033[0m'

echo -e "${SUCCESS_COLOR} ❤️ Setting Up Started ❤️ ${NO_COLOR}"

# Load environment variables from .env file
source .env

# Function to prompt for yes/no confirmation
confirm() {
    read -r -p "$1 [y/N]: " response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
        return 0
    else
        return 1
    fi
}

if ! confirm "If you filled .env file continue. Otherwise we have a problem"; then
    echo -e "${ERROR_COLOR}Skipping Installation. Exiting... Fill .env and come back...${NO_COLOR}"
    exit 1
fi


# Check if Oh-My-Zsh is already installed
if [[ ! -d "$ZSH" && ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Installing OMZ"
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
else
    echo "OMZ is already installed."
fi

mkdir -p "$DOTFILES_PATH"
echo 'dotfiles folder created...'

echo 'Cloning dotfiles repository...'
git clone --quiet "$DOTFILES_SSH_LINK" "$DOTFILES_PATH"
echo -e "${SUCCESS_COLOR}Dotfiles repository cloned successfully${NO_COLOR}"

mkdir -p ~/Projects ~/Screenshots ~/Personal ~/Scripts ~/devTools
echo 'Necessary folder are created'

if confirm "Do you want to overwrite .zprofile and .zshrc files?"; then
    echo "Overwriting .zprofile and .zshrc files."

    cp ~/.zprofile /tmp/..zprofile
    rm -rf ~/.zprofile
    cp "$DOTFILES_PATH"/.zprofile ~/.zprofile
    echo -e "${SUCCESS_COLOR} $HOME/.zprofile backup saved. Replaced with the dotfiles version${NO_COLOR}"


    cp ~/.zshrc /tmp/..zshrc
    rm -rf ~/.zshrc
    cp "$DOTFILES_PATH"/.zshrc ~/.zshrc
    echo -e "${SUCCESS_COLOR} $HOME/.zshrc backup saved. Replaced with the dotfiles version${NO_COLOR}"

else
    echo "Skipping .zprofile and .zshrc files."
fi



#WIP
#chmod +x ~/.dotfiles/ssh.sh
#~/.dotfiles/ssh.sh

# Make clone.sh executable and run it
chmod +x "$DOTFILES_PATH"/clone.sh
"$DOTFILES_PATH"/clone.sh

# Clone zsh-autosuggestions plugin
if ! [[ -d "$DOTFILES_PATH/plugins/zsh-autosuggestions" ]]; then
    git clone --quiet https://github.com/zsh-users/zsh-autosuggestions "$DOTFILES_PATH/plugins/zsh-autosuggestions"
fi
echo -e "${SUCCESS_COLOR} zsh-autosuggestions plugin cloned successfully ${NO_COLOR}"

# Clone powerline fonts repository and run install script
if ! [[ -d "$DOTFILES_PATH/fonts" ]]; then
    git clone --quiet https://github.com/powerline/fonts.git "$DOTFILES_PATH/fonts"
    echo -e "${SUCCESS_COLOR} Powerline fonts repository cloned successfully ${NO_COLOR}"

    echo "Installing powerline fonts..."
    cd "$DOTFILES_PATH/fonts" || exit
    ./install.sh
    cd - || exit
fi
echo -e "${SUCCESS_COLOR} Powerline fonts installed successfully ${NO_COLOR}"

# Clone additional repositories and install dependencies if needed
# Example: git clone <REPO_URL> ~/Projects/lelele
# Example: cd ~/Projects/lelele && npm install

echo -e "${SUCCESS_COLOR} ❤️ Installation completed successfully ❤️ ${NO_COLOR}"