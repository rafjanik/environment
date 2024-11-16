#!/bin/bash

# Virtualbox
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor
sudo apt-get update
sudo apt-get install virtualbox-7.0 -y

# Qemu
apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon -y
systemctl enable --now libvirtd
apt install virt-manager -y
newgrp libvirt
