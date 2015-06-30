#/bin/bash

apt -y remove openntpd ntp ntpdate
apt -y install ntp

echo '# /etc/ntp.conf, configuration for ntpd; see ntp.conf(5) for help

driftfile /var/lib/ntp/ntp.drift


# Enable this if you want statistics to be logged.
#statsdir /var/log/ntpstats/

statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable

server ntp.cdrflorac.fr iburst prefer

restrict default ignore
restrict 127.0.0.1
restrict ::1

restrict ntp.cdrflorac.fr
restrict ntp.cdrflorac.fr mask 255.255.255.255 nomodify notrap nopeer noquery
' > /etc/ntp.conf

sudo service ntp restart