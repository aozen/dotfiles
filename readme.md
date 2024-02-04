# Ali`s dotFiles

## Download

Git clone

```bash
git clone git@github.com:aozen/dotfiles.git ~/.dotfiles
```

Without `git`:

```bash
mkdir -p ~/.dotfiles && wget -O- https://github.com/aozen/dotfiles/archive/refs/heads/master.tar.gz | tar -xz --strip-components=1 -C ~/.dotfiles
```

## Installation

1. Go to the main folder. `cd ~/.dotfiles`
2. Prepare your `.env` file.
3. Run `install` script

```bash
  cd ~/.dotfiles
  ./install.sh 2>&1 | tee latest-summary
```

## What dotfiles do?

1. Creates necessary folders on home directory
1. Backup specified databases for mysql and mongodb
1. Install Git
1. Clone my repositories
1. Setup Shell
    - Install zsh, oh-my-zsh and setup plugins (autosuggestions, syntax-highlighting)
    - Generate .zshrc file
    - Setup powerline fonts for ZSH Agnoster Theme
1. Install Docker
1. Install Redis
1. Install Nodejs
1. Install Mongodb
1. Install Go
1. Install Vscode
1. Install Chrome
1. Install Guake
1. Install Postman
1. Install Slack
1. Install Discord

## Backup Checklist

- commit latest changes
- copy/export IDE settings
- copy .env file
- check latest backups ~/Backups

## Additional Steps

- After fresh zsh installation, go to `Profiles`, `Edit Profile`, `Text`. Then activate `Use built-in Powerline glyphs` via checkbox. Otherwise some icons may not display.
- Install apps manually # WIP
  - If default terminal didnt changed => `chsh -s $(which zsh)`
- Custom Settings # WIP

## Remove ZSH

```bash
uninstall_oh_my_zsh
sudo apt-get --purge remove zsh
```

## Format Checklist

- copy home directory
- copy hidden files/folders
- copy ssh
- export thunderbird
- `dpkg --get-selections > /tmp/package_list.txt`
- check & copy sources.list `cp -r /etc/apt/sources.list* /path/to/backup/location`
- copy apache folder
- copy var/www
- copy crontab settings `crontab -l > /tmp/crontab`
- WIP
