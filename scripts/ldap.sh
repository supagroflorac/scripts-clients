#!/bin/bash

DEBIAN_FRONTEND='noninteractive' apt-get -y install libpam-ldapd &&

#Parametrage de nsswitch.conf
cp /etc/nsswitch.conf /etc/nsswitch.conf.bak`date +%Y%m%d` &&
echo 'passwd:         compat ldap
group:          compat ldap
shadow:         compat ldap

hosts:          files mdns4_minimal [NOTFOUND=return] dns mdns4
networks:       files

protocols:      db files
services:       db files
ethers:         db files
rpc:            db files

netgroup:       nis' > /etc/nsswitch.conf &&

# Configuration du service nslcd
cp /etc/nslcd.conf /etc/nslcd.conf.bak`date +%Y%m%d` &&
echo "# The user and group nslcd should run as.
uid nslcd
gid nslcd

# The location at which the LDAP server(s) should be reachable.
uri ldap://bdc-florac.cdrflorac.fr/

# The search base that will be used for all queries.
base dc=florac,dc=meta

# The LDAP protocol version to use.
ldap_version 3

ssl start_tls
tls_reqcert never

base passwd ou=Users,dc=florac,dc=meta
map passwd loginshell \"/bin/bash\"
" > /etc/nslcd.conf &&

echo "#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will \"exit 0\" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

service nslcd restart

exit 0
" > "/etc/rc.local" &&



service nslcd restart
