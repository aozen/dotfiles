#!/bin/bash

source ~/.dotfiles/.env
source ~/.dotfiles/helper.sh

echo_title "INSTALL GO"

if command -v go &> /dev/null; then
    echo -e "${WARNING_COLOR}Go is already installed${NO_COLOR}"
    echo "$(go version)"
    exit 0
fi

echo "Downloading Go..."
cd /tmp/

wget -q https://golang.org/dl/go1.21.5.linux-amd64.tar.gz && echo "Go downloaded"

sudo tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz > /dev/null 2>&1 && echo "Go installed"

mkdir -p $HOME/go/bin $HOME/go/pkg $HOME/go/src

cd - > /dev/null

if command -v go &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Go installed successfully${NO_COLOR}"
    echo "$(go version)"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Go${NO_COLOR}"
    exit 1
fi