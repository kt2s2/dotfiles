#!/bin/sh

echo Start setup



echo What OS do you use?
ans1="OSX"
ans2="Ubuntu"
ans3="CentOS"
select ANS in "$ans1" "$ans2" "$ans3"; do
  case "$ANS" in
    "$ans1")
      brew install tmux zsh clang-format ctags
      break
      ;;
    "$ans2")
      sudo apt-get -y update
      sudo apt-get -y install build-essential zsh clang-format-3.6 exuberant-ctags
      break
      ;;
    "$ans3")
      sudo yum -y update
      sudo yum -y install zsh
      break
      ;;
    *)
      echo 無効です
      ;;
  esac
done


echo Symbolic link settings...
files=`find linked -maxdepth 1 -type f | sed "s!^.*/!!" | grep -vE ".DS_Store"`
for file in ${files[@]}; do
  ln -s `pwd`/linked/$file $HOME/$file
done



echo Vim settings...
if [ -e $HOME/.vim/backup ]; then
  echo Already exist $HOME/.vim/backup
else
  mkdir -p $HOME/.vim/backup
  echo Created $HOME/.vim/backup
fi
if [ -e $HOME/.vim/snippets ]; then
  echo Already exist $HOME/.vim/snippets
else
  mkdir -p $HOME/.vim/snippets
  echo Created $HOME/.vim/snippets
  snippets=`find linked/.vim/snippets -maxdepth 1 -type f | sed "s!^.*/!!" | grep -vE ".DS_Store"`
  for file in ${snippets[@]}; do
    ln -s `pwd`/linked/.vim/snippets/$file $HOME/.vim/snippets/$file
  done
fi



echo Neobundle settings...
if [ -e $HOME/.vim/bundle ]; then
  echo Already installed neobundle
else
  mkdir -p $HOME/.vim/bundle
  echo Created $HOME/.vim/bundle
  git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
  echo Installed neobundle
fi



echo Load shell file
if [ -e $HOME/.zshrc ]; then
  . $HOME/.zshrc
fi


git config --global init.templatedir '.git_tmp'
