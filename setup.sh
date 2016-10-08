#!/bin/bash

DOT_FILES=(.bashrc .bash_profile .zshrc .vimrc .gvimrc .gitconfig .gitignore .vim .tmux.conf getwifi.sh get_volume_tmux.sh)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/src/github.com/sa-inu/dotfiles/linked/$file $HOME/$file
done

source $HOME/.bash_profile
source $HOME/.bashrc
source $HOME/.zshrc
