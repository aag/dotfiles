#!/bin/bash

git submodule update # Update Vundle
stow -R -v -t ~/ vim
vim -n -c "set nomore" -c ":PluginInstall!" -c ":q" -c ":q" -c ":q"
