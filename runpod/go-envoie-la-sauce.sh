#!/bin/bash
# Petit script pour envoyer toute la sauce pour démarrer le modèle Ornith sur un pod de runpod
#zf260807.1130

#set -e -v -x
#set -v


read -p $'\nCertain que vous voulez envoyer toute la sauce ? \n\nctrl-c pour arrêter\n'

echo -e "Installation de llama.ccp\n"
./11-install-llama-ccp.sh

echo -e "Installation de huggingface_hub\n"
./12-install-huggingface_hub.sh

echo -e "Download-ornith1.0-35b-q4km\n"
./21-download-ornith1.0-35b-q4km.sh

echo -e "Start-ornith1.0-35b-q4km\n"
./31-start-ornith1.0-35b-q4km.sh

