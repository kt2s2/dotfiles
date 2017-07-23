#!/bin/sh
echo "Which web server do you install?"
ans1="nginx"
ans2="apache"
select ANS in $ans1 $ans2; do
  case $ANS in
    $ans1)
      break;;
    $ans2)
      sudo yum -y install httpd
      sudo service httpd start
      sudo chkconfig httpd on
      sudo service iptables stop
      sudo chkconfig iptables off
      break;;
  esac
done
