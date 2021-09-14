#!/bin/bash

set -ue



RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
DEBUG=0



# OSを判定
if [ $(uname) = 'Darwin' ]; then
  OS='Mac'
elif [ $(uname) = 'Linux' ]; then
  OS='Linux'
else
  echo "Your platform ($(uname)) is not supported."
  exit 1
fi



while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      DEBUG=1
      ;;
    *)
      ;;
  esac
  shift
done



function install() {
  echo "${GREEN}INSTALL${NC} Install $1 to setup dotfiles"
  if command_exists brew; then
    brew $1
  elif command_exists apt-get; then
    apt-get install -y --no-install-recommends $1
  fi
}


function command_exists() {
  if type $1 > /dev/null 2>&1; then
    echo "${GREEN}EXISTS${NC} $1 command to setup dotfiles"
    # 0 = true
    return 0
  else
    echo "${RED}NOT FOUND${NC} $1 command to setup dotfiles"
    # 1 = false
    return 1
  fi
}


# dependencies
command_exists curl || install curl
command_exists unzip || install unzip


# download dotfiles

tempfile=/tmp/dotfiles.zip
workspace=/tmp/dotfiles

rm -rf ${workspace} ${tempfile}

echo "Download dotfiles repository..."
if [ $DEBUG = 1 ]; then
  mkdir -p ${workspace}/dotfiles-master
  cp -r ./ ${workspace}/dotfiles-master/
else
  curl -LSfs -o ${tempfile} https://github.com/sainu/dotfiles/archive/master.zip
  unzip -oq ${tempfile} -d ${workspace}
fi

pushd ${workspace}/dotfiles-master > /dev/null



if [ $OS = 'Mac' ]; then
  # Install homebrew
  echo "Install homebrew..."
  which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi



# dotfilesを設置
echo
read -p "Install dotfiles? (y/n) " yn
if [ $yn = "y" -o $yn = "Y" ]; then
  DOT_FILES=(.gitconfig .gitignore .pryrc .tmux.conf .vimrc .zshrc)

  for file in ${DOT_FILES[@]}
  do
    if [ -e $HOME/$file ]; then
      echo -ne "${YELLOW}EXISTS${NC} $HOME/$file"
      read -p " override? (y/n) " yn
    fi

    if [ $yn = "y" -o $yn = "Y" ]; then
      rm -rf $HOME/$file
      cp `pwd`/$file $HOME/$file
      echo -e "${GREEN}CREATE${NC} $HOME/$file"
    fi
  done
fi



if [ $OS = 'Mac' ]; then
  # finderで隠しファイルを表示する
  echo
  read -p "Do you wish to show hidden files with Finder? (y/n) " yn
  if [ $yn = "y" -o $yn = "Y" ]; then
    defaults write com.apple.finder AppleShowAllFiles TRUE
    echo -e "${GREEN}DONE${NC} Set setting to show all files in Finder App"
    killall Finder
    echo -e "${GREEN}DONE${NC} Restart Finder App"
  fi

  # .DS_Storeを作らないようにする
  echo
  read -p "Never create .DS_Store? (y/n) " yn
  if [ $yn = "y" -o $yn = "Y" ]; then
    defaults write com.apple.desktopservices DSDontWriteNetworkStores true
    echo -e "${GREEN}DONE${NC} Set setting to not write .DS_Store"
  fi
fi



# デフォルトシェルを変更
echo
read -p "Do you wish to change default shell? (zsh/n) " sh
if [ $sh = "zsh" ]; then
  command_exists zsh || install zsh
  chsh -s $(which zsh)
  source $HOME/.zshrc
  echo -e "${GREEN}DONE${NC} Change shell to $(which zsh)"
elif [[ $sh != "n" ]]; then
  echo -e "${RED}Input ($sh) not supported :(${NC}"
fi



# Move to original path
popd > /dev/null



# Cleanup
rm -rf ${tempfile} ${workspace}
