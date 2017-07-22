#!/bin/sh
echo ''
echo Login shell settings...
if ! echo $SHELL | grep -q zsh; then
  sudo yum -y install zsh
fi
zsh_path=`which zsh`
sudo chsh -s $zsh_path
