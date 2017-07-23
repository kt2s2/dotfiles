#!/bin/sh
CMDNAME=`basename $0`
USAGE="Usage: $CMDNAME [-u] package1 package2 ..."

while getopts r OPT; do
  case $OPT in
    "u")
      FLAG_U="TRUE"
      break;;
    *)
      echo $USAGE 1>&2
      exit 1;;
  esac
done

if [ $# -e 0 ]; then
  echo $USAGE 1>&2
  exit 1
fi

if [ $FLAG_U = "TRUE" ]; then
  for name in "$@"; do
    sudo yum -y update $name
  done
else
  for name in "$@"; do
    sudo yum -y install $name
  done
fi
