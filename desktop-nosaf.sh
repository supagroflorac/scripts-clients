#!/bin.bash
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
        printf "%s\n" $pos "Erreur"
        exit 1
    fi
    printf "%s\n" $pos "ok"
}

exec_script "configuration d'APT"                           apt.sh
exec_script 'Mise à jour du système'                        update.sh
exec_script 'Installation des logiciels'                    software.sh
exec_script "Désactivation des rapports d'erreur"           apport.sh
exec_script "Protection de la vie privée"                   fixubuntu.sh

exit 0
