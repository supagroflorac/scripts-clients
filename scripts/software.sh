#!/bin/bash

# TODO : décommenter la ligne du dépot partner
# TODO : commenter les lignes

# Utilitaires
apt -y install vim aptitude ssh &&

# Accepte la licence pour les polices Microsoft.
echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true' | debconf-set-selections &&

# Installation des logiciels contenus dans les dépots
apt -y install freemind gimp geany vlc r-base inkscape scribus audacity \
    openshot flashplugin-installer kdenlive ttf-mscorefonts-installer \
    icedtea6-plugin qgis gdal-bin openshot avidemux pdfsam \
    pdfshuffler 
