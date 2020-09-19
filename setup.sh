#!/bin/sh

echo Create directories
mkdir -p ~/.vim/snippets
mkdir -p ~/.vim/rc

echo Symbolic link settings...
files=`find home -type f | sed -e 's/home\///g'`
for file in ${files[@]}; do
  unlink $HOME/$file
  ln -s `pwd`/home/$file $HOME/$file
done
