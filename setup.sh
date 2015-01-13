#!/bin/bash -e -x

ln -is ~/.config/vim/vimrc ~/.vimrc
ln -is ~/.config/gitconfig ~/.gitconfig
ln -is ~/.config/hgrc ~/.hgrc
ln -is ~/.config/bashrc ~/.bashrc
ln -is ~/.config/bashrc ~/.bash_profile
ln -is ~/.config/hammerspoon ~/.hammerspoon

git clone https://github.com/gmarik/Vundle.vim.git ~/.config/vim/bundle/Vundle.vim
