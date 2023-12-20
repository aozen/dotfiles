# Ali`s dotFiles

- Create ~/.dotfiles project
- Install ZSH
- Make ZSH Default Terminal
- Install Oh-my-zsh
- Setup zsh-autosuggestions plugin
- Setup zsh-syntax-highlighting plugin
- Generate .zshrc file
- Create folders like Project, Screenshots etc
- Clone some repositories
- Setup powerline fonts for ZSH Agnoster Theme

## Backup Checklist

- commit latest changes
- copy phpstorm, vscode settings // WIP
- copy .env file
- db backup // WIP

## Installation

Run `install` script. Assuming exist in `~/.dotfiles`

```bash
  ~/.dotfiles/install.sh
```

## Additional Steps

- After fresh zsh installation, go to `Profiles`, `Edit Profile`, `Text`. Then activate `Use built-in Powerline glyphs` via checkbox. Otherwise some icons may not display.
- Install apps manually # List soon
- Custom Settings # Settings soon

## Remove ZSH

```bash
uninstall_oh_my_zsh
sudo apt-get --purge remove zsh
```
