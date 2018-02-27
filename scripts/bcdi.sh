#!/usr/bin/env bash

VM='bcdi'
FOLDER="$HOME/.virtualbox/$VM"

# Vérifie si l'utilisateur est dans le groupe vboxusers
if ! groups bredow | grep -q "vboxusers"; then
    # Sinon le rajoute.
    sudo adduser $USER vboxusers
fi

mkdir -p ~/"$FOLDER"

# Créé la machine virtuelle
VBoxManage createvm --name "$VM" \
                    --ostype "WindowsXP" \
                    --basefolder "$FOLDER/.." \
                    --register

VBoxManage modifyvm "$VM" --memory 512 \
                          --acpi on \
                          --nic1 bridged \
                          --bridgeadapter1 eth0

VBoxManage storagectl "$VM" --name "IDE Controller" \
                            --add ide

# Télécharge le disque a partir du serveur
cd "$FOLDER"
wget http://serveur/bcdi.vdi
cd -

VBoxManage storageattach "$VM" --storagectl "IDE Controller" \
                               --port 0 \
                               --device 0 \
                               --type hdd \
                               --medium "$FOLDER/$VM.vdi"
