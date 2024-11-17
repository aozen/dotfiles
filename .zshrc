#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* DEFAULT ZSHRC
#---------------------------------------------------------------------------------------------------------------------------------------------------#

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

HIST_STAMPS="dd/mm/yyyy"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting you-should-use)

# Set zsh-autosuggestions color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

source $HOME/.oh-my-zsh/oh-my-zsh.sh
unalias -m '*'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.starship.toml

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* DEFAULT ZSHRC
#---------------------------------------------------------------------------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* SYSTEM & OPTIONS
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias crontab='EDITOR=nano /usr/bin/crontab'
alias memoryeaters='ps aux | sort -nr -k 4 | head -10'
alias cpueaters='ps aux --sort=-%mem | awk '\''{printf "%-10s %-8s %-6s %-6s %-8s %-8s %-8s %-10s %s\n", $1, $2, $3, $4, $5, $6, $7, $9, $11}'\'' | head -10'

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
#                   *START* GOTO
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias home="cd ~/"
alias goprojects="cd ~/Projects"

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* GOTO
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* LIST
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias ll='ls -FGlAhp'
alias sortedit='ls --color=always -lt --time-style=+"%Y-%m-%d %H:%M:%S" | awk "{print \$6, \$7, \$8}"'
alias countfile='find . -type f | wc -l'
alias countdir='find . -type d -mindepth 1 | wc -l'
alias sortAll='du -ah | sort -hr'
alias sortFolders='du -h --max-depth=1 | sort -hr'
du_sort() {
    if [[ "$2" == "--all" ]]; then
        sudo du -ah --max-depth=1 "$1" | sort -hr
    else
        sudo du -h --max-depth=1 "$1" | sort -hr
    fi
}

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* LIST
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* FILTERING
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias checkIps="sudo grep -roE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' ./* --exclude-dir={node_modules,mongodb,cache} --exclude='*.svg' | sort | uniq -c | sort -nr"
alias checkUrls='grep -roE "https?://[a-zA-Z0-9./?=_-]*" ./* --exclude-dir={node_modules,mongodb,cache,logs} --exclude=package.json --exclude=package-lock.json | sort | uniq -c | sort -nr'
alias checkEmails='grep -roE --color=always "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}" ./* --exclude-dir={node_modules,mongodb,cache,logs} --exclude=package.json --exclude=package-lock.json | awk -F: '\''{print $2}'\'' | sort | uniq -c | sort -nr'

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* FILTERING
#---------------------------------------------------------------------------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* NETWORK
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias ip="curl ipecho.net/plain; echo"
alias pingpong='ping -c 5 google.com'
alias ports='sudo lsof -i'

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* NETWORK
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* EDITORS
#---------------------------------------------------------------------------------------------------------------------------------------------------#

PHPSTORM_VERSION=$(ls /opt | grep PhpStorm)
alias phpstorm='open_phpstorm'
open_phpstorm() {
    (/opt/$PHPSTORM_VERSION/bin/phpstorm.sh "$1" >/dev/null 2>&1 &) > /dev/null 2>&1
}
GOLAND_VERSION=$(ls /opt | grep GoLand)
alias goland='open_goland'
open_goland() {
    (/opt/$GOLAND_VERSION/bin/goland.sh "$1" >/dev/null 2>&1 &) > /dev/null 2>&1
}

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* EDITORS
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* THINGS
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias weather='curl wttr.in'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
alias qr='qrencode -m 2 -t utf8 <<< "$1"'
alias randompass='openssl rand -base64 12'
alias hosts='sudo nano /etc/hosts'
alias vhosts='sudo nano /etc/apache2/extra/httpd-vhosts.conf'

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* THINGS
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* PATHS
#---------------------------------------------------------------------------------------------------------------------------------------------------#

# global laravel command. ex: laravel new test
export PATH="$PATH:$HOME/.composer/vendor/bin"

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* PATHS
#---------------------------------------------------------------------------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* SCRIPTS
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias scriptMongo='bash ~/Scripts/mongo-export-restore/mongo_main.sh'
alias {testExport,exportTest}='dotenv -e ../.test.env npx nyc --report-dir="$HOME/Tests/$(basename "$PWD")/$(date +%Y-%m-%d_%H:%M)" --reporter=html --reporter=text --reporter=text-summary ./node_modules/.bin/_mocha --reporter spec --exit lib/**/*.test.js'


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* SCRIPTS
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* JAVASCRIPT
#---------------------------------------------------------------------------------------------------------------------------------------------------#

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load Angular CLI autocompletion.
source <(ng completion script)

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* JAVASCRIPT
#---------------------------------------------------------------------------------------------------------------------------------------------------#

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* PHP
#---------------------------------------------------------------------------------------------------------------------------------------------------#

# Laravel Rollback last and migrate again
alias lr-remigrate-last='php artisan migrate:rollback --step=1; php artisan migrate;'

# quick PEST
alias {pest,lrtest,lrunittest,phpunit}='./vendor/bin/pest'

# quick PINT
alias lrpint='./vendor/bin/pint'

# clear Laravel Logs
alias lrclearlog='truncate -s 0 $PWD/storage/logs/laravel.log'
alias lrclearlogs='truncate -s 0 $PWD/storage/logs/*.log'
alias lrclearAll='php artisan cache:clear && php artisan view:clear && php artisan config:clear && php artisan route:clear && php artisan clear-compiled'

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* PHP
#---------------------------------------------------------------------------------------------------------------------------------------------------#


#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *START* BE GENTLE
#---------------------------------------------------------------------------------------------------------------------------------------------------#

alias please="sudo"

#---------------------------------------------------------------------------------------------------------------------------------------------------#
#                   *END* BE GENTLE
#---------------------------------------------------------------------------------------------------------------------------------------------------#

