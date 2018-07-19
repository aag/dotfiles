#!/bin/bash

git submodule update # Update Vundle
stow -R -v -t ~/ vim
vim -n -es -c "set nomore" -c ":PluginInstall!"
