#!/bin/bash
# Petit script pour retrouver ses clefs ssh quand le pod est reconstruit
#zf260804.1427, zf260804.1721


# use: source /workspace/init_pod.sh

read -p "

Usage: 

source /workspace/z-llama-ccp/init_pod.sh

et si c'est la toute 1ère fois que le pod démarre, il faut faire avant:

/workspace/z-llama-ccp/init_apt.sh

ctrl-c pour arrêter

"
#read -p "Etes-vous certain de vouloir continuer ?"


# 1. Restauration des clés SSH
if [ -d "/workspace/.ssh" ]; then
    mkdir -p /root/.ssh
    chmod 700 /root/.ssh
    cp -r /workspace/.ssh/* /root/.ssh/
    chmod 600 /root/.ssh/id_ed25519
    
    # Lancement de l'agent pour le système
    eval $(ssh-agent -s) > /dev/null
    ssh-add /root/.ssh/id_ed25519 > /dev/null 2>&1
fi

# 2. Injection automatique dans le .bashrc du NOUVEAU conteneur
# Cela permet d'avoir vos clés prêtes dès que vous vous connectez en SSH
cat << 'INNER_EOF' >> /root/.bashrc
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval $(ssh-agent -s) > /dev/null
    ssh-add /root/.ssh/id_ed25519 > /dev/null 2>&1
fi
INNER_EOF

ssh -T git@github.com

echo "✅ Environnement SSH restauré avec succès."

#apt update

rm -rf /var/lib/apt/lists
ln -s /workspace/apt/lists /var/lib/apt/lists
rm -rf /var/cache/apt/archives
ln -s /workspace/apt/archives /var/cache/apt/archives



apt install htop nvtop
/workspace/deploy-proxmox/env_a_zuzu.sh
export LANG=C.UTF-8
source /workspace/deploy-proxmox/alias
echo "✅ Environnement SSH restauré avec succès."

