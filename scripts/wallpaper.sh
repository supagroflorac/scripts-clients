#/bin/bash

# Modification du fond d'écran
mv -f /usr/share/backgrounds/warty-final-ubuntu.png \
      /usr/share/backgrounds/warty-final-ubuntu2.png &&
cp data/warty-final-ubuntu.png /usr/share/backgrounds/ &&
chmod o+r /usr/share/backgrounds/warty-final-ubuntu.png 