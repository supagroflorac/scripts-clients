#!/usr/bin/env bash

# Création de l'utilisateur
useradd --create-home --comment "Poste" --groups adm,lpadmin,sudo,sambashare supagro --shell /bin/bash &&
echo -e 'supagro48\nsupagro48\n' | passwd supagro &&

#Ajout d'un signet pour le Serveur
echo "file:///home/supagro/T%C3%A9l%C3%A9chargements
smb://serveur/ Serveur" > /home/supagro/.gtk-bookmarks
