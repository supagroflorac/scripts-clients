#!/usr/bin/env bash

# Désactive les dépots pour les sources.
sed -i -e "s/^deb-src/# deb-src/g" /etc/apt/sources.list

# Active le dépôt partner
sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list

# Retournera toujours que c'est bon même si aucun remplacement n'a eu lieu
true
