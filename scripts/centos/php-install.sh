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
      sudo yum -y install --enablerepo=remi,remi-php56 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt;;
    $ans2)
      sudo yum -y install --enablerepo=remi,remi-php70 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt;;
    $ans3)
      sudo yum -y install --enablerepo=remi,remi-php71 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt;;
  esac
done
