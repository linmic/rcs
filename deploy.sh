#!/bin/sh

ln -is $PWD/home/* $HOME
mkdir -p $HOME/.config/nvim
ln -is $PWD/nvim/* $HOME/.config/nvim
vim +PlugInstall +qall
