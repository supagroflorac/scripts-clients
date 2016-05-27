#!/bin/bash

apt-add-repository -y -u ppa:ubuntugis/ubuntugis-unstable

# Installation de QGis
apt-get -y install qgis python-qgis qgis-plugin-grass libgdal-dev expect
# expect sert uniquement a valider automatique la licence de ERDAS-ECXJPG
