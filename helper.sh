#!/bin/bash

# Colors
NO_COLOR='\033[0m'
ERROR_COLOR='\033[0;31m'
SUCCESS_COLOR='\033[0;32m'
WARNING_COLOR='\033[0;33m'
TITLE_COLOR='\033[0;34m'
INVERSE_COLOR='\033[7m'

# Main Title Styles
echo_title() {
  echo -e "\n${INVERSE_COLOR}##### $1 #####${NO_COLOR}"
}

# Function to prompt for yes/no confirmation
confirm() {
    read -r -p "$1 [y/N]: " response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
        return 0
    else
        return 1
    fi
}