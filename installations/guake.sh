#!/bin/bash

source ~/.dotfiles/.env
source ~/.dotfiles/helper.sh

echo_title "INSTALL GUAKE"

if command -v guake &> /dev/null; then
    echo -e "${WARNING_COLOR}Guake Terminal is already installed${NO_COLOR}"
    echo $(guake --version | awk '/Guake Terminal/{print $3}')
    exit 0
fi

sudo add-apt-repository ppa:linuxuprising/guake -y > /dev/null 2>&1
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 73C3DB2A > /dev/null 2>&1

sudo apt install guake -y > /dev/null 2>&1

if command -v guake &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Guake Terminal installed successfully${NO_COLOR}"
    echo $(guake --version | awk '/Guake Terminal/{print $3}')
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Guake Terminal${NO_COLOR}"
    exit 1
fi