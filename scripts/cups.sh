#!/bin/bash

# Configuration de cups
apt-get -y purge cups cups-client &&
rm -r /etc/cups &&
mkdir /etc/cups &&
chown root:lp /etc/cups &&
echo "ServerName 10.48.21.27:631" > /etc/cups/client.conf 
