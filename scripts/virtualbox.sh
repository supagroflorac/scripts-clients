#!/usr/bin/env bash

apt remove virtualbox virtualbox-dkms

echo 'deb http://mirror.cdrflorac.fr/download.virtualbox.org/virtualbox/debian trusty contrib
' > /etc/apt/sources.list.d/virtualbox.list

wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- \
    | sudo apt-key add -

apt update

apt -y install virtualbox-4.3 build-essential dkms linux-source linux-headers-`uname -r`

# Ajoute la gestion de l'USB2
version=$(VBoxManage --version|cut -dr -f1|cut -d'_' -f1) &&
cd /tmp
wget -c "http://download.virtualbox.org/virtualbox/$version/Oracle_VM_VirtualBox_Extension_Pack-$version.vbox-extpack"
VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-$version.vbox-extpack
rm *.vbox-extpack
cd -
