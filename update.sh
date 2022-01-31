#!/bin/bash

# Install or update Vundle
git submodule init
git submodule sync
git submodule update

# Set up vim dotfiles
stow --restow --verbose --target="$HOME/" vim

# Create vim directories, if missing
mkdir -p "$HOME/.vim/files/backup"
mkdir -p "$HOME/.vim/files/info"
mkdir -p "$HOME/.vim/files/swap"
mkdir -p "$HOME/.vim/files/undo"

# Install or update all vim plugins using Vundle
# -n = no swap file
# -c = execute command
#vim -n -c "set nomore" -c ":PluginInstall!" -c ":q" -c ":q" -c ":q"

# Install or update vim plugins using vim-plug
vim -n -c "set nomore" -c ":PlugUpdate" -c ":q" -c ":q" -c ":q"

# Set up bash dotfiles
stow --restow --verbose --target="$HOME/" bash

# Set up git config files
stow --restow --verbose --target="$HOME/" git

