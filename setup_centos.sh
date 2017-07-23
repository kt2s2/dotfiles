#!/bin/sh
echo Start setup

./scripts/setup-webserver.sh
./scripts/symbolic-link.sh
./scripts/setup-login-shell.sh
./scripts/setup-vim.sh

git config --global init.templatedir '.git_tmp'

exec $SHELL -l
