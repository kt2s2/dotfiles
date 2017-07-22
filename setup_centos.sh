#!/bin/sh
echo Start setup

sudo yum -y update
sudo yum -y install git

./scripts/symbolic-link.sh

./scripts/setup-login-shell.sh

./scripts/load-zshrc.sh

./scripts/init-vim.sh

./scripts/setup-vim.sh

git config --global init.templatedir '.git_tmp'
