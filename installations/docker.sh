#!/bin/bash
source ./.env
source ./helper.sh

if command -v docker &> /dev/null; then
    echo -e "${WARNING_COLOR}Docker is already installed${NO_COLOR}"
    exit 0
fi

sudo apt-get install ca-certificates curl gnupg > /dev/null

sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /etc/apt/keyrings/docker.gpg > /dev/null

sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \

sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update > /dev/null 2>&1

echo "Downloading Docker..."
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin > /dev/null

if command -v docker &> /dev/null; then
    echo -e "${SUCCESS_COLOR}Docker installed successfully${NO_COLOR}"
    exit 0
else
    echo -e "${ERROR_COLOR}Failed to install Docker${NO_COLOR}"
    exit 1
fi