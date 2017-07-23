#!/bin/sh
echo "Which mysql version do you install?"
ans0="not install"
ans1="5.6"
select ANS in $ans0 $ans1; do
  case $ANS in
    $ans0)
      echo "SKIP"
      break;;
    $ans1)
      sudo yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
      sudo yum-config-manager --disable mysql56-community
      sudo yum-config-manager --enable mysql55-community
      sudo yum -y install mysql mysql-devel mysql-server mysql-utilities
      sudo /etc/rc.d/init.d/mysqld start
      sudo chkconfig mysqld on

      sudo yum -y install python-pip python-devel
      sudo pip install mycli
      break;;
  esac
done
