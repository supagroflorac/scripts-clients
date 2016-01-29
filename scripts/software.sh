#!/bin/bash

# Utilitaires
apt -y install vim aptitude ssh &&

# Accepte la licence pour les polices Microsoft.
echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true' | debconf-set-selections &&

# Installation des logiciels contenus dans les dépots
apt -y install freemind gimp geany vlc r-base inkscape scribus audacity vim \
    flashplugin-installer kdenlive ttf-mscorefonts-installer ssh freecad \
    icedtea6-plugin qgis gdal-bin avidemux pdfsam aptitude pdfshuffler
