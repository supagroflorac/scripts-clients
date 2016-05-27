#!/bin/bash

# Supprime la fenetre de mise a jour de la version
gconftool --set --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory --type bool /apps/update-notifier/auto_launch false
true
