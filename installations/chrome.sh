#!/bin/bash

source ./.env
source ./helper.sh

echo_title "INSTALL GOOGLE CHROME"

if command -v google-chrome &> /dev/null; then
    echo -e "${WARNING_COLOR}Google Chrome is already installed.${NO_COLOR}"
    echo "Google Chrome Version: $(google-chrome --version | awk '{print $3}')"
    exit 0
fi

sudo apt-get install google-chrome-stable -y > /dev/null 2>&1

if command -v google-chrome &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Google Chrome installed successfully.${NO_COLOR}"
    echo "Google Chrome Version: $(google-chrome --version | awk '{print $3}')"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Google Chrome.${NO_COLOR}"
    exit 1
fi