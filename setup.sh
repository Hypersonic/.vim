#!/bin/sh

echo "source ~/.vim/vimrc" > ~/.vimrc
cd ~/.vimrc
git submodule update --init
