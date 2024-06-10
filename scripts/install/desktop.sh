#!/bin/bash

apt update && apt upgrade -y

apt install git curl mc bat

snap install postman
snap install insomnia
snap install kubectl --classic
snap install code --classic

snap install phpstorm --classic
snap install pycharm-community --classic

# Double Commander
add-apt-repository ppa:alexx2000/doublecmd
apt update
apt install doublecmd-gtk

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f ./google-chrome-stable_current_amd64.deb