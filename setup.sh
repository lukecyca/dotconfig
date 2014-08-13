#!/bin/bash -e -x

ln -is ~/.config/vim/vimrc ~/.vimrc
ln -is ~/.config/gitconfig ~/.gitconfig
ln -is ~/.config/hgrc ~/.hgrc
ln -is ~/.config/bashrc ~/.bashrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.config/vim/bundle/Vundle.vim
