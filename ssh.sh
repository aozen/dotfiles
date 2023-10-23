#!/bin/sh

echo "Configuring SSH key and tokens for GitHub... "

# ssh-add ~/.ssh/id_rsa
# ssh-add -K ~/.ssh/id_ed25519 # -K for mac chain

# Alternative ssh keys (TODO: add .env.examples)
# ssh-add ~/.ssh/custom_key_name

# git remote set-url origin https://<token>@github.com/<git_url>
# token usage

echo "Configuration completed"