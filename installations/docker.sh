#!/bin/bash

source ~/.dotfiles/.env
source ~/.dotfiles/helper.sh

echo_title "INSTALL DOCKER"

if command -v docker &> /dev/null; then
    echo -e "${WARNING_COLOR}Docker is already installed${NO_COLOR}"
    echo "$(docker -v)"
    exit 0
fi

sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /etc/apt/keyrings/docker.gpg > /dev/null

sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \

sudo apt update

sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Downloading Docker..."
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin > /dev/null

if command -v docker &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Docker installed successfully${NO_COLOR}"
    echo "$(docker -v)"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Docker${NO_COLOR}"
    exit 1
fi