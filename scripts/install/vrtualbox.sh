# Virtualbox
apt-get install virtualbox -y

# Qemu
apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon -y
systemctl enable --now libvirtd
apt install virt-manager -y
newgrp libvirt
