#!/bin/bash
# Petit script pour envoyer toute la sauce pour démarrer le modèle Ornith sur un pod de runpod
#zf260807.1114

#set -e -v -x
#set -v


read -p $'\nCertain que vous voulez envoyer toute la sauce ? \n\nctrl-c pour arrêter\n'

exit

./runpod-11-install-llama-ccp.sh
./runpod-12-install-huggingface_hub.sh
./runpod-21-download-ornith1.0-35b-q4.sh
./runpod-31-start-ornith1.0-35b-q4km.sh


