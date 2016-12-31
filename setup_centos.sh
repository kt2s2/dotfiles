sudo yum update -y
curl -L git.io/nodebrew | perl - setup
touch ~/.bash_profile
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile
