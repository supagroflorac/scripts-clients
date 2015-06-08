#/bin/bash

#Configuration par defaut de GDM
cp /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.bak`date +%Y%m%d`
echo "[SeatDefaults]
user-session=ubuntu
greeter-session=unity-greeter
greeter-show-manual-login=true
allow-guest=false
greeter-hide-users=true" > /etc/lightdm/lightdm.conf