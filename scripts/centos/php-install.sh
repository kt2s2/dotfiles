#!/bin/sh
echo "Which php version do you install?"
ans0="not install"
ans1="5.6"
ans2="7.0"
ans3="7.1"
select ANS in $ans1 $ans2 $ans3; do
  case $ANS in
    $ans0)
      echo "SKIP"
      break;;
    $ans1)
      sudo rpm -Uvh http://ftp.iij.ad.jp/pub/linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
      sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
      sudo yum -y install --enablerepo=remi --enablerepo=remi-php56 php php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pecl-xdebug php-pecl-xhprof;;
    $ans2)
      sudo yum -y install --enablerepo=remi,remi-php70 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt;;
    $ans3)
      sudo yum -y install --enablerepo=remi,remi-php71 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt;;
  esac
done
