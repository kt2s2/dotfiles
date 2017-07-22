#!/bin/sh
CMDNAME=`basename $0`
if [ $# -e 0 ]; then
  echo "Usage: $CMDNAME package1 package2 ..." 1>&2
  exit 1
fi

for name in "$@"; do
  sudo yum -y install $name
done
