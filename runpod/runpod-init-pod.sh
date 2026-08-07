#!/bin/bash
# Petit script pour retrouver ses outils quand le pod est reconstruit
#zf260804.1427, zf260807.1023

#set -e -v -x
set -v


read -p $'\nUsage:\n\n\e[45m\e[97msource /workspace/z-llama-ccp/init_pod.sh\e[0m \n\net si c\'est la toute 1ère fois que le pod démarre, il faut faire avant: \n\n/workspace/z-llama-ccp/init_apt.sh\n\nctrl-c pour arrêter\n'


ssh -T git@github.com

echo "✅ Environnement SSH restauré avec succès."


apt update
apt install htop nvtop

/workspace/deploy-proxmox/env_a_zuzu.sh
export LANG=C.UTF-8
source /workspace/deploy-proxmox/alias

echo "✅ Utillitaires restaurés avec succès."

