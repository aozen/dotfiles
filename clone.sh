#!/bin/sh

# Colors for terminal output
SUCCESS_COLOR='\033[0;32m'
ERROR_COLOR='\033[0;31m'
NO_COLOR='\033[0m'
TITLE_COLOR='\033[0;33m'

echo "${TITLE_COLOR} Cloning Repositories... ${NO_COLOR}"

# Load environment variables from .env file
source .env

clone_repository() {
    _repository_url=$1
    _destination=$2

    echo "${TITLE_COLOR} \n PROCESSING =====> '$_destination' ${NO_COLOR}:"

    if [ ! -d "$_destination" ]; then
        if git clone --quiet "$_repository_url" "$_destination"; then
            echo "${SUCCESS_COLOR} $_destination cloned successfully ${NO_COLOR}"
        else
            echo "${ERROR_COLOR}Error: Repository cloning failed ${NO_COLOR}"
        fi
    else
        echo "${WARNING_COLOR} Destination directory '$_destination' already exists. Skipping cloning. ${NO_COLOR}"
    fi
}

# Public repositories
clone_repository git@github.com:aozen/portfolio.git "$PROJECTS_PATH"/portfolio
clone_repository git@github.com:aozen/aozen.git "$PROJECTS_PATH"/githubreadme
clone_repository git@github.com:aozen/chess-board.git "$PROJECTS_PATH"/chessboard
clone_repository git@github.com:aozen/flip-flop.git "$PROJECTS_PATH"/flipflop
clone_repository git@github.com:aozen/tic-tac-toe.git "$PROJECTS_PATH"/tictactoe
clone_repository git@github.com:aozen/covid-19.git "$PROJECTS_PATH"/covid19
clone_repository git@github.com:aozen/language-detector.git "$PROJECTS_PATH"/languagedetector
clone_repository git@github.com:aozen/astar.git "$PROJECTS_PATH"/astar
clone_repository git@github.com:aozen/repository-design-pattern.git "$PROJECTS_PATH"/repository-pattern

# Private repositories
clone_repository git@github.com:aozen/filament-examples.git "$PROJECTS_PATH"/filamentexamples
clone_repository git@github.com:aozen/IMDBer.git "$PROJECTS_PATH"/imdber

echo "${SUCCESS_COLOR} Cloning completed. ${NO_COLOR}"