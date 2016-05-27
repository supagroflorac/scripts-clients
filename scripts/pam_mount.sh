#!/bin/bash

server="serveur.cdrflorac.fr"

#Installation des paquets nécessaires
DEBIAN_FRONTEND='noninteractive' apt-get -y install cifs-utils libpam-mount

cp /etc/security/pam_mount.conf.xml /etc/security/pam_mount.conf.xml.bak`date +%Y%m%d`
echo '<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE pam_mount SYSTEM "pam_mount.conf.xml.dtd">
<!--
    See pam_mount.conf(5) for a description.
-->

<pam_mount>

        <!-- debug should come before everything else,
        since this file is still processed in a single pass
        from top-to-bottom -->

<debug enable="0" />

        <!-- Volume definitions -->

        <!--home-->
            <volume options="acl,iocharset=utf8" user="*"
            mountpoint="~/Reseau/Reseau-Perso"
            path="%(USER)"
            server="'$server'" fstype="cifs" />
            <!--SupAgro-->
            <volume options="acl,iocharset=utf8" user="*"
            mountpoint="~/Reseau/Reseau-Activites"
            path="Activites"
            server="'$server'" fstype="cifs" />
            <!--Stages-->
            <volume options="acl,iocharset=utf8" user="*"
            mountpoint="~/Reseau/Reseau-Stagiaires"
            path="Stagiaires"
            server="'$server'" fstype="cifs" />
            <!--Ressources-->
        <volume options="acl,iocharset=utf8" user="*"
            mountpoint="~/Reseau/Reseau-Ressources"
            path="Ressources"
            server="'$server'" fstype="cifs" />


        <!-- pam_mount parameters: General tunables -->

<!--
<luserconf name=".pam_mount.conf.xml" />
-->

<!-- Note that commenting out mntoptions will give you the defaults.
     You will need to explicitly initialize it with the empty string
     to reset the defaults to nothing. -->
<mntoptions allow="nosuid,nodev,loop,encryption,fsck,nonempty,allow_root,allow_o
ther" />
<!--
<mntoptions deny="suid,dev" />
<mntoptions allow="*" />
<mntoptions deny="*" />
-->
<mntoptions require="nosuid,nodev" />

<logout wait="0" hup="0" term="0" kill="0" />


        <!-- pam_mount parameters: Volume-related -->

<mkmountpoint enable="1" remove="true" />

</pam_mount>' > /etc/security/pam_mount.conf.xml
