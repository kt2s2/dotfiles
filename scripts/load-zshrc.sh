#!/bin/sh
echo ''
echo Load zshrc...
if [ -e $HOME/.zshrc ]; then
  source $HOME/.zshrc
fi
zsh
