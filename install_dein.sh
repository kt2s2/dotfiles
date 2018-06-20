#!/bin/sh

cd /tmp/dein

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh

mkdir -p ~/.cache/dein

sh ./installer.sh ~/.cache/dein

rm `pwd`/installer.sh
