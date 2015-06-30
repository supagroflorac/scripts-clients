#/bin/bash

GS="/usr/bin/gsettings"
CCUL="com.canonical.Unity.lenses"

# Check if Canonical schema is present. Take first match, ignoring case.
SCHEMA="$($GS list-schemas | grep -i $CCUL | head -1)"
if [ -z "$SCHEMA" ] 
    then
        printf "Error: could not find Canonical schema %s.\n" "$CCUL" 1>&2
        exit 1
    else
        CCUL="$SCHEMA"
fi

# Turn off "Remote Search", so search terms in Dash aren't sent to the internet
$GS set "$CCUL" remote-content-search none

$GS set "$CCUL" disabled-scopes \
    "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope',
    'more_suggestions-populartracks.scope', 'music-musicstore.scope',
    'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope',
    'more_suggestions-skimlinks.scope']"

# Block connections to Ubuntu's ad server, just in case
if ! grep -q "127.0.0.1 productsearch.ubuntu.com" /etc/hosts; then
  echo -e "\n127.0.0.1 productsearch.ubuntu.com" | sudo tee -a /etc/hosts >/dev/null
fi

# Editing /etc/hosts is OK, but adding an iptables rule seems to be
# a more elegant solution
sudo iptables -A OUTPUT -d 91.189.92.11 -j REJECT

# Suppression de l'icone amazon
rm -f "/usr/share/applications/ubuntu-amazon-default.desktop"
rm -f "/usr/share/unity-webapps/userscripts/unity-webapps-amazon/Amazon.user.js"
