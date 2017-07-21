#!/bin/sh
echo Start setup

echo What OS do you use?
ans1="OSX"
ans2="Ubuntu"
ans3="CentOS"
select ANS in "$ans1" "$ans2" "$ans3"; do
  case "$ANS" in
    "$ans1")
      brew install zsh tmux clang-format ctags
      break
      ;;
    "$ans2")
      sudo apt-get -y update
      sudo apt-get -y install zsh build-essential clang-format-3.6 exuberant-ctags
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

echo ''
echo Symbolic link settings...
files=`find linked -maxdepth 1 -type f | sed "s!^.*/!!" | grep -vE ".DS_Store"`
for file in ${files[@]}; do
  ln -s `pwd`/linked/$file $HOME/$file
done

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

git config --global init.templatedir '.git_tmp'
