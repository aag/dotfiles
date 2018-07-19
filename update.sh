#!/bin/bash

# Install or update Vundle
git submodule init
git submodule sync
git submodule update

# Set up vim dotfiles
stow --restow --verbose --target="$HOME/" vim

# Install or update all vim plugins using Vundle
# -n = no swap file
# -c = execute command
vim -n -c "set nomore" -c ":PluginInstall!" -c ":q" -c ":q" -c ":q"

# Set up bash dotfiles
stow --restow --verbose --target="$HOME/" bash

# Set up git config files
stow --restow --verbose --target="$HOME/" git

