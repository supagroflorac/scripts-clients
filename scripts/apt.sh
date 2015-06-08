#/bin/bash

# Désactive les dépots pour les sources.
sed -i -e "/^deb-src/# deb-src/g" /etc/apt/source.list

# Active le dépôt partner
echo "deb http://archive.canonical.com/ $(lsb_release -sc) partner" \
    > /etc/apt/source.list.d/partner.list

# Retournera toujours que c'est bon même si aucun remplacement n'a eu lieu
true