#!/bin/sh
echo Start setup

sudo yum -y update

./scripts/setup-webserver.sh
./scripts/symbolic-link.sh
./scripts/setup-login-shell.sh
./scripts/load-zshrc.sh
./scripts/setup-vim.sh

git config --global init.templatedir '.git_tmp'

exec $SHELL -l
