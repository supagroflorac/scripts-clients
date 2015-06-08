#/bin.bash
#-*- coding: utf-8 -*-

exec_script(){
    text="$1 : "
    echo -n $text
    length=$(echo $text|wc -m)      # Utilise wc pour compter les caractère
                                    # et non les octets
    columns=$(tput cols)
    pos=$((columns - length + 1))
    ./scripts/$2 >> error.log 2>> error.log
    if [ $? -ne 0 ]; then
        printf "\e[31m%*s\n\e[39m" $pos "Erreur"
        exit 1
    fi
    printf "\e[32m%*s\n\e[39m" $pos "ok"
}

exec_script "configuration d'APT"                           apt.sh

exec_script 'Mise à jour du système'                        update.sh
    
exec_script 'Installation des logiciels'                    software.sh

exec_script 'Installation de LDAP'                          ldap.sh

exec_script 'Installation de pam_mount'                     pam_mount.sh

exec_script "Installation d'OCS"                            ocs.sh

exec_script 'Installation du scanner'                       scanner.sh

exec_script "Configuration de NTP"                          ntp.sh

exec_script "Configuration de cups"                         cups.sh

exec_script "Configuration de Mozilla Firefox"              firefox.sh

exec_script "Configuration de l'écran d'accueil"            lightdm.sh

exec_script "Désactivation des notifcations de version"     gconf.sh

exec_script "Désactivation des rapports d'erreur"           apport.sh

exec_script "Remplacement du fond d'écran"                  wallpaper.sh

exit 0
