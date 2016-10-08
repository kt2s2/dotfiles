#!/bin/bash

DOT_FILES=(.bashrc .bash_profile .zshrc .vimrc .gvimrc .gitconfig .gitignore .vim .tmux.conf getwifi.sh)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/src/github.com/sa-inu/dotfiles/linked/$file $HOME/$file
done
