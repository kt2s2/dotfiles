#!/bin/sh
echo ''
echo Symbolic link settings...
files=`find linked -maxdepth 1 -type f | sed "s!^.*/!!" | grep -vE ".DS_Store"`
for file in ${files[@]}; do
  ln -s `pwd`/linked/$file $HOME/$file
done
