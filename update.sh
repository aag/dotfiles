#!/bin/bash

# Install or update Vundle
git submodule init
git submodule sync
git submodule update

# Set up vim dotfiles
stow -R -v -t ~/ vim

# Install or update all vim plugins using Vundle
vim -n -c "set nomore" -c ":PluginInstall!" -c ":q" -c ":q" -c ":q"
