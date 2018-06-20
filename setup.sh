#!/bin/sh

echo ''
echo Symbolic link settings...
files=`find linked -maxdepth 1 -type f | sed "s!^.*/!!" | grep -vE ".DS_Store"`
for file in ${files[@]}; do
  ln -s `pwd`/linked/$file $HOME/$file
done


echo ''
echo Vim settings...
ln -s `pwd`/linked/.vim/ $HOME/.vim


echo ''
echo Login shell settings...
if ! echo $SHELL | grep -q zsh; then
  zsh_path=`which zsh`
  chsh -s $zsh_path
  if [ $? -gt 1 ]; then
    echo Successful change of login shell!
  fi
  exec $SHELL -l
fi

echo ''
echo Load zshrc...
if [ -e $HOME/.zshrc ]; then
  source $HOME/.zshrc
fi

