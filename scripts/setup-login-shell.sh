#!/bin/sh
echo ''
echo Login shell settings...
if ! type zsh > /dev/null 2>&1; then
  ./scripts/install-package.sh zsh
fi
zsh_path=`which zsh`
sudo chsh -s $zsh_path
