# sudo yum update -y
curl -L git.io/nodebrew | perl - setup
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile
exec $SHELL -l
nodebrew install-binary stable
nodebrew use stable
