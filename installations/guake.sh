#!/bin/bash
source ./.env
source ./helper.sh

# Check if Guake Terminal is already installed
if command -v guake &> /dev/null; then
    echo -e "${WARNING_COLOR}Guake Terminal is already installed${NO_COLOR}"
    echo $(guake --version | awk '/Guake Terminal/{print $3}')
    exit 0
fi

# Add Guake repository and key
sudo add-apt-repository ppa:linuxuprising/guake -y > /dev/null 2>&1
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 73C3DB2A > /dev/null 2>&1

# Install Guake Terminal
sudo apt-get install guake -y > /dev/null 2>&1

# Check if Guake installation is successful
if command -v guake &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Guake Terminal installed successfully${NO_COLOR}"
    echo $(guake --version | awk '/Guake Terminal/{print $3}')
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Guake Terminal${NO_COLOR}"
    exit 1
fi