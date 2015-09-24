#!/bin/bash

#suppression de l'ancienne config
rm -r /etc/cups

#copie de la configuration par defaut
cd /
wget http://serveur/cups.tgz
tar xvzf cups.tgz
rm /cups.tgz
cd -

# installation des paquets
apt-get -y install bluez-cups cups cups-browsed cups-bsd cups-client cups-common cups-core-drivers cups-daemon cups-filters cups-filters-core-drivers cups-pk-helper cups-ppdc cups-server-common libcups2 libcupscgi1 libcupsfilters1 libcupsmime1 libcupsppdc1 printer-driver-hpcups python-cups python-cupshelpers