#!/usr/bin/env zsh
# Create softlinks to config files/dirs in the home dir
#   -s: create softlinks
#   -n: handle dirs like files, i.e. do not create a link with the dir when it already exists
#

# First get the absolute dirname of the install script
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Link custom scripts
ln -sn "${DOTFILES_DIR}/scripts" ~/.local/scripts

# Link zsh files
ln -sn "${DOTFILES_DIR}/zsh/.zshenv" ~/.zshenv
ln -sn "${DOTFILES_DIR}/zsh/.zshrc" ~/.zshrc

# Link git config
ln -sn "${DOTFILES_DIR}/.gitconfig" ~/.gitconfig

# Link tmux config
ln -sn "${DOTFILES_DIR}/tmux/.tmux.conf" ~/.tmux.conf

# Create .config directory if it doesn't exist
mkdir -p ~/.config

# Link nvim config
ln -sn "${DOTFILES_DIR}/nvim/" ~/.config/nvim

# Link alacritty config files
ln -sn "${DOTFILES_DIR}/alacritty.toml" ~/.config/alacritty.toml

