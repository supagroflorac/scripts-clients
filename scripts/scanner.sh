#!/bin/bash

# Installation du Scanner
#  - xsltproc est necessaire pour iscan
#  - libjpeg62 permet d'activer l'export en jpeg dans iscan
apt -y install xsltproc libjpeg62 &&
dpkg -i data/iscan/*.deb
