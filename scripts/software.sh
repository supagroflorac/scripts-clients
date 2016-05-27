#!/bin/bash

# Accepte la licence pour les polices Microsoft.
echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true' | debconf-set-selections &&

# Installation des logiciels contenus dans les dépots
apt -y install vim ssh freeplane gimp geany vlc r-base inkscape scribus \
    audacity adobe-flashplugin ttf-mscorefonts-installer freecad libreoffice \
    icedtea-plugin pdfsam pdfshuffler openshot kdenlive
