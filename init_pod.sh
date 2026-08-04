#!/bin/bash
# Petit script pour retrouver ses clefs ssh quand le pod est reconstruit
#zf260804.1427


# use: /workspace/init_pod.sh



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

echo "✅ Environnement SSH restauré avec succès."
