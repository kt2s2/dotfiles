#!/bin/sh
echo ''
echo Vim settings...
echo Confirm $HOME/.vim/snippets existance
if [ -e $HOME/.vim/snippets ]; then
  echo Already exist $HOME/.vim/snippets
else
  echo Not found $HOME/.vim/snippets
  mkdir -p $HOME/.vim/snippets
  echo Created $HOME/.vim/snippets
  snippets=`find linked/.vim/snippets -maxdepth 1 -type f | sed "s!^.*/!!" | grep -vE ".DS_Store"`
  for file in ${snippets[@]}; do
    ln -s `pwd`/linked/.vim/snippets/$file $HOME/.vim/snippets/$file
  done
fi

echo ''
echo Neobundle settings...
echo Confirm $HOME/.vim/bundle existance
if [ -e $HOME/.vim/bundle ]; then
  echo Already installed neobundle
else
  mkdir -p $HOME/.vim/bundle
  echo Created $HOME/.vim/bundle
  echo Start to clone neobundle.vim
  git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
fi
