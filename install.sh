#!/bin/bash

echo "❤️Setting Up Started❤️"

source .env

if ! confirm "If you filled .env file continue. Otherwise we have a problem"; then
    echo "Skipping Installation. Exiting... Fill .env and comeback..."
    exit 1
fi

if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi


mkdir -p "$DOTFILES_PATH"
echo 'dotfiles folder created...'

echo 'dotfiles repository is installing...'
git clone --quiet "$DOTFILES_SSH_LINK" "$DOTFILES_PATH"
echo 'dotfiles repository installed successfully...'

mkdir -p ~/Projects
mkdir -p ~/Screenshots
mkdir -p ~/Personal
mkdir -p ~/Scripts
mkdir -p ~/devTools
echo 'Necessary folder are created'

if confirm "Do you want to overwrite .zprofile and .zshrc files?"; then
    echo "Overwriting .zprofile and .zshrc files."

    cp ~/.zprofile /tmp/..zprofile
    echo '.zprofile copied to /tmp/'

    #WIP
    #cp ~/.zshrc /tmp/..zshrc
    #echo '.zshrc copied to /tmp/ '

    rm -rf ~/.zprofile
    cp "$DOTFILES_PATH"/.zprofile ~/.zprofile
    echo "~/.zprofile removed"
    echo "~/.zprofile created from $DOTFILES_PATH/.zprofile"

    #WIP
    #rm -rf $HOME/.zshrc
    #cp $HOME/.dotfiles/.zshrc $HOME/.zshrc
    #echo "$HOME/.zshrc removed"
    #echo "$HOME/.zshrc created from $HOME/.dotfiles/.zshrc"

else
    echo "Skipping .zprofile and .zshrc files."
fi



#WIP
#chmod +x ~/.dotfiles/ssh.sh
#~/.dotfiles/ssh.sh

chmod +x "$DOTFILES_PATH"/clone.sh
"$DOTFILES_PATH"/clone.sh


# Clone additional repositories and install dependencies if needed
# Example: git clone <REPO_URL> ~/projects/myproject
# Example: cd ~/projects/myproject && npm install

#TODO: In .zshrc file add plugins=(zsh-autosuggestions) // plugins=(zsh-autosuggestions, git, composer) add useful
# Right now it was added to .zprofile but brew version. Edit later
git clone --quiet https://github.com/zsh-users/zsh-autosuggestions "$HOME"/.dotfiles/plugins/zsh-autosuggestions
echo "zsh-autosuggestions installed "

echo "Setup completed successfully."

# Function to prompt for yes/no confirmation
confirm() {
    read -r -p "$1 [y/N]: " response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
        return 0
    else
        return 1
    fi
}

#Oh My Zsh
installOmz() {
  if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
  else
    echo "Oh My Zsh is already installed."
  fi
}