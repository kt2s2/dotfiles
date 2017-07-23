#!/bin/sh
echo Start setup

./scripts/centos/install-package.sh yum-utils

./scripts/centos/setup-webserver.sh
./scripts/centos/symbolic-link.sh
./scripts/centos/setup-login-shell.sh
./scripts/centos/setup-vim.sh
./scripts/centos/php-install.sh
./scripts/centos/mysql-install.sh

git config --global init.templatedir '.git_tmp'
