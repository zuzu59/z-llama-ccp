#!/bin/bash
# Petit script pour retrouver ses outils quand le pod est reconstruit
#zf260804.1427, zf260815.1002

#set -e -v -x
#set -v


read -p $'\nUsage:\n\n\e[45m\e[97msource /workspace/z-llama-ccp/runpod/init_pod.sh\e[0m \n\nctrl-c pour arrêter\n'


ssh -T git@github.com

echo -e "✅ Environnement SSH restauré avec succès.\n"



# On vérifie si le dossier de cache d'APT contient des fichiers de dépôts
if [ -n "$(ls -A /var/lib/apt/lists/ 2>/dev/null | grep -v 'partial')" ]; then
    echo ""
else
    apt-get update
fi



apt install -y htop nvtop tree

/workspace/z-llama-ccp/runpod/env_a_zuzu.sh
export LANG=C.UTF-8
source /workspace/z-llama-ccp/runpod/alias > /dev/null 2>&1

echo -e "✅ Utillitaires restaurés avec succès.\n"

