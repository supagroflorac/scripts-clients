#!/usr/bin/env bash

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
uri ldap://10.48.21.27/

# The search base that will be used for all queries.
base dc=florac,dc=meta

# The LDAP protocol version to use.
ldap_version 3

ssl start_tls
tls_reqcert never

base passwd ou=Users,dc=florac,dc=meta
map passwd loginshell \"/bin/bash\"
" > /etc/nslcd.conf &&


# Ajoute le redémarrage de nslcd a la fin du boot de la machine
if ! grep -q 'service nslcd restart' /etc/rc.local ; then
    sed -i "s#exit 0#sleep 10s && service nslcd restart\n\nexit 0#" /etc/rc.local
fi


# Evite que le service nslcd en se lance pas sur les machines un peu trop rapide.
sed -i 's#start-stop-daemon --stop --oknodo --pidfile $K5START_PIDFILE#start-stop-daemon --stop --oknodo --retry 10 --pidfile $K5START_PIDFILE#' /etc/init.d/nslcd
sed -i 's#start-stop-daemon --stop --oknodo \\#start-stop-daemon --stop --oknodo --retry 10 \\#' /etc/init.d/nslcd

systemctl daemon-reload

service nslcd restart
