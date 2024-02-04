#!/bin/bash

source ./.env
source ./helper.sh

echo_title "INSTALL GOOGLE CHROME"

if command -v google-chrome &> /dev/null; then
    echo -e "${WARNING_COLOR}Google Chrome is already installed.${NO_COLOR}"
    echo "Google Chrome Version: $(google-chrome --version | awk '{print $3}')"
    exit 0
fi

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt-get install google-chrome-stable -y

if command -v google-chrome &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Google Chrome installed successfully.${NO_COLOR}"
    echo "Google Chrome Version: $(google-chrome --version | awk '{print $3}')"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Google Chrome.${NO_COLOR}"
    exit 1
fi