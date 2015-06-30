#/bin/bash

# Désactive les dépots pour les sources.
sed -i -e "s/^deb-src/# deb-src/g" /etc/apt/sources.list

# Active le dépôt partner
echo "deb http://archive.canonical.com/ $(lsb_release -sc) partner" \
    > /etc/apt/sources.list.d/partner.list

# Retournera toujours que c'est bon même si aucun remplacement n'a eu lieu
true
