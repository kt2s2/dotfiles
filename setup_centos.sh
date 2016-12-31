#!/bin/bash

# sudo yum update -y

# install node
curl -L git.io/nodebrew | perl - setup
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile
nodebrew install-binary stable
nodebrew use stable

# install ruby
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
sudo yum install -y openssl-devel readline-devel zlib-devel
rbenv install $(rbenv install -l | grep -v - | tail -1)
rbenv rehash
rbenv global $(rbenv install -l | grep -v - | tail -1)

mkdir $HOME/vimbackup

DOT_FILES=(.vimrc .gitconfig)
for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/linked/$file $HOME/$file
done
