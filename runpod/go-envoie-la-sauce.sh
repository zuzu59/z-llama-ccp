#!/bin/bash
# Petit script pour envoyer toute la sauce pour démarrer le modèle Ornith sur un pod de runpod
#zf260915.1149

#set -e -v -x
#set -v


read -p $'\nCertain que vous voulez envoyer toute la sauce ? \n\nctrl-c pour arrêter\n'

echo -e "\e[45m\e[97mClear l'installation...\e[0m\n"
rm -rf /workspace/.cache/ /workspace/llama.cpp/ /workspace/models/


echo -e "\e[45m\e[97mInstallation des utilitaires...\e[0m\n"
./01-init-pod.sh

echo -e "\e[45m\e[97mInstallation de llama.ccp...\e[0m\n"
./11-install-llama-ccp.sh

echo -e "\e[45m\e[97mInstallation de huggingface_hub...\e[0m\n"
./12-install-huggingface_hub.sh

echo -e "\e[45m\e[97mDownload-ornith1.5...\e[0m\n"
#./21-download-ornith1.0-35b-q4km.sh
./21-download-ornith1.5-35b-80.sh

echo -e "\e[45m\e[97mStart-ornith1.5...\e[0m\n"
#./31-start-ornith1.0-35b-q4km.sh
./31-start-ornith1.5-35b-80.sh
