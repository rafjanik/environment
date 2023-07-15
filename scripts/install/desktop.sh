#!/bin/bash

apt update && apt upgrade -y

apt install git curl mc bat

snap install chromium
snap install postman
snap install kubectl --classic
snap install code --classic

snap install phpstorm --classic
snap install webstorm --classic
snap install pycharm-professional --classic

# Double Commander
add-apt-repository ppa:alexx2000/doublecmd
apt update
apt install doublecmd-gtk

# Virtualbox
apt-get install git curl mc bat virtualbox -y

# Qemu
apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon -y
systemctl enable --now libvirtd
apt install virt-manager -y
newgrp libvirt
