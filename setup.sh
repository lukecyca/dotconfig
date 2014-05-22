#!/bin/bash -e -x

ln -is ~/.config/vim/vimrc ~/.vimrc
ln -is ~/.config/gitconfig ~/.gitconfig
ln -is ~/.config/hgrc ~/.hgrc
ln -is ~/.config/bashrc ~/.bashrc

git clone http://github.com/gmarik/vundle.git ~/.config/vim/bundle/vundle
