#!/usr/bin/env bash

sudo apt purge -y libreoffice*

cd /tmp
wget http://serveur/libreoffice.tar.gz

tar xvzf libreoffice.tar.gz
sudo dpkg -i libreoffice/*.deb

rm -r libreoffice
rm libreoffice.tar.gz

cd -
