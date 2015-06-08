#/bin/bash

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
uri ldap://serveur.cdrflorac.fr/

# The search base that will be used for all queries.
base dc=florac,dc=meta

# The LDAP protocol version to use.
ldap_version 3

ssl start_tls
tls_reqcert never

base passwd ou=Users,dc=florac,dc=meta
map passwd loginshell \"/bin/bash\"
" > /etc/nslcd.conf && 

service nslcd restart

# Hack permettant aux utilisateur LDAP de se reconnecter après un vérouillage écran.
# BUG : https://bugs.launchpad.net/ubuntu/+source/unity/+bug/1314095
chmod u+s /sbin/unix_chkpwd