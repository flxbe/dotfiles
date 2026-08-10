#!/usr/bin/env zsh
# Create softlinks to config files/dirs in the home dir
#   -s: create softlinks
#   -n: handle dirs like files, i.e. do not create a link with the dir when it already exists

# First get the absolute dirname of the dotfiles repository
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# root config files
ln -sn "${DOTFILES_DIR}/zsh/.zshenv" ~/.zshenv
ln -sn "${DOTFILES_DIR}/zsh/.zshrc" ~/.zshrc
ln -sn "${DOTFILES_DIR}/.gitconfig" ~/.gitconfig
ln -sn "${DOTFILES_DIR}/tmux/.tmux.conf" ~/.tmux.conf

# files in .local
mkdir -p ~/.local
ln -sn "${DOTFILES_DIR}/scripts" ~/.local/scripts

# files in .config
mkdir -p ~/.config
ln -sn "${DOTFILES_DIR}/herdr/config.toml" ~/.config/herdr/config.toml
ln -sn "${DOTFILES_DIR}/nvim/" ~/.config/nvim
ln -sn "${DOTFILES_DIR}/alacritty.toml" ~/.config/alacritty.toml

