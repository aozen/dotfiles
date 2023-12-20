#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* DEFAULT ZSHRC
#---------------------------------------------------------------------------------------------------------------------------------------------------#

export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

HIST_STAMPS="dd/mm/yyyy"

# this is opens a gate for plugins
ZSH_CUSTOM=$DOTFILES

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Set zsh-autosuggestions color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* DEFAULT ZSHRC
#---------------------------------------------------------------------------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* PHP
#---------------------------------------------------------------------------------------------------------------------------------------------------#

# global laravel command. ex: laravel new test
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Laravel Rollback last and migrate again
alias remigrate-last='php artisan migrate:rollback --step=1; php artisan migrate;'

# quick PEST
alias {pest,test,unittest,phpunit}='./vendor/bin/pest'

# quick PINT
alias pint='./vendor/bin/pint'

# clear Laravel Logs
alias clearlog='truncate -s 0 $PWD/storage/logs/laravel.log'
alias clearlogs='truncate -s 0 $PWD/storage/logs/*.log'
alias clearAll='php artisan cache:clear && php artisan view:clear && php artisan config:clear && php artisan route:clear && php artisan clear-compiled'

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* PHP
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* SYSTEM & OPTIONS
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias crontab='EDITOR=nano /usr/bin/crontab'
alias memoryeaters='ps aux | sort -nr -k 4 | head -10'
alias cpueaters='ps aux | sort -nr -k 3 | head -10'

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* SYSTEM & OPTIONS
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* GIT
#---------------------------------------------------------------------------------------------------------------------------------------------------#

# better gitlog
alias {glog, glog1}="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glog2='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

# copy personal access token key (aozen github)
alias copytoken='echo ghp_...G | pbcopy'

# copy public ssh key
alias copykey='command cat ~/.ssh/id_ed25519.pub | pbcopy'

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* GIT
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* NAVIGATION
#---------------------------------------------------------------------------------------------------------------------------------------------------#

# typo FIX :(
alias cd..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* NAVIGATION
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* GOTO
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias home="cd ~/"
alias godotfiles="cd ~/.dotfiles"
alias goprojects="cd ~/Projects"

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* GOTO
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* LIST
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias ll='ls -FGlAhp'
alias sortedit='ls -t -1'
alias countfile='find . -type f | wc -l'
alias countdir='find . -type d -mindepth 1 | wc -l'

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* LIST
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* HOSTS
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias hosts='sudo nano /etc/hosts'
alias vhosts='sudo nano /etc/apache2/extra/httpd-vhosts.conf'

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* HOSTS
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* NETWORK
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias {ip, ip_e}="curl ipecho.net/plain; echo"
alias ip_i="ipconfig getifaddr en0"
alias pingbomb='ping -c 5 google.com'

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* NETWORK
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* BE GENTLE
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias please="sudo"

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* BE GENTLE
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* MACOS
#---------------------------------------------------------------------------------------------------------------------------------------------------#

# Open current folder in Finder
alias openf='open -a Finder ./'

# Switch hidden file display
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* MACOS
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* THINGS
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias weather='curl wttr.in'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
alias qr='qrencode -m 2 -t utf8 <<< "$1"'
alias randompass='openssl rand -base64 12'

# Added by Toolbox App
export PATH="$PATH:/Users/ali.oezen/Library/Application Support/JetBrains/Toolbox/scripts"

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* THINGS
#---------------------------------------------------------------------------------------------------------------------------------------------------#
