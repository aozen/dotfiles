#!/bin/bash
source ./helper.sh

if ! command -v zsh &> /dev/null; then
    echo "ZSH is not installed. Installing ZSH"
    sudo apt install zsh -y &> /dev/null
    echo -e "${SUCCESS_COLOR}ZSH is installed${NO_COLOR}"
else
    echo -e "${WARNING_COLOR}ZSH is already installed${NO_COLOR}"
fi