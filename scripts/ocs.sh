#/bin/bash

# Installation de ocs-inventory
DEBIAN_FRONTEND='noninteractive' apt -y install ocsinventory-agent
echo 'server=ocsinventory-ng' > /etc/ocsinventory/ocsinventory-agent.cfg &&
ocsinventory-agent