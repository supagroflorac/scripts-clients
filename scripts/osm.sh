#!/bin/bash

## Installation de Maperitive
apt-get -y install mono-runtime libmono-winforms2.0-cil mono-complete

cd /tmp
wget http://serveur/Maperitive-latest.zip
cd /opt
rm -r /opt/Maperitive
unzip /tmp/Maperitive-latest.zip
chmod -R ugo+rwX /opt/Maperitive
chmod ugo+x /opt/Maperitive/Maperitive.sh
rm /usr/bin/Maperitive
ln /opt/Maperitive/Maperitive.sh /usr/bin/Maperitive

convert /opt/Maperitive/Maperitive.ico /usr/share/app-install/icons/Maperitive.png
mv /usr/share/app-install/icons/Maperitive-0.png /usr/share/app-install/icons/Maperitive.png
rm /usr/share/app-install/icons/Maperitive-*.png

echo "[Desktop Entry]
Type=Application
Version=1.0
Name=Maperitive
GenericName=Maperitive
Comment=Application for drawing maps based on OpenStreetMap and GPS data
Icon=maperitive
Exec=/opt/Maperitive/Maperitive.sh
Terminal=false
StartupNotify=true
Categories=Education;Geoscience;Maps;
Keywords=OpenStreetMap;OSM;" >  /usr/share/applications/maperitive.desktop

echo '#!/bin/sh
cd /opt/Maperitive
mono --desktop Maperitive.exe "$@"' > /opt/Maperitive/Maperitive.sh

## Installation de JOSM
wget -q http://josm.openstreetmap.de/josm-apt.key -O- | sudo apt-key add -
echo "deb http://josm.openstreetmap.de/apt trusty universe" > /etc/apt/sources.list.d/josm.list

if [ "$(dpkg-query -W -f='${Status}' josm 2>/dev/null | grep -c 'ok installed')" -eq 0 ];
then
  apt-get update
  apt-get -y install josm default-jre
fi
