#!/usr/bin/env bash
#Petit script pour installer le serveur llama.ccp sur runpod en copiant directement, sans compiler, le binaire depuis github
#Cette astuce permet de gagner 20 minutes de copilation
#zf260609.1606, zf260806.1805

# source: https://github.com/ai-dock/llama.cpp-cuda/releases


#set -e -v -x
#set -v -x
#set -v

export FOLDER_LLAMA="/workspace/llama.ccp/build/bin"
export VERSION_LLAMA="b10290"
export URL_GITHUB_LLAMA="https://github.com/ai-dock/llama.cpp-cuda/releases/download/$VERSION_LLAMA/llama.cpp-$VERSION_LLAMA-cuda-12.8-amd64.tar.gz"



mkdir -p $FOLDER_LLAMA
cd $FOLDER_LLAMA
wget $URL_GITHUB_LLAMA

tar -xzf llama* --no-same-owner
rm llama*
mv cuda-12.8/* ./

# superbe astuce de google ia pour avoir le bon path dans toutes les lib llama.ccp comme si on l'avait compilé sur cette machine

#apt-get update && apt-get install -y patchelf

for f in /workspace/llama.ccp/build/bin/*; do
    if [ ! -d "$f" ]; then
        echo "Patch du RPATH ($ORIGIN) pour : $(basename "$f")"
        patchelf --force-rpath --set-rpath '$ORIGIN' "$f"
    fi
done


cd ../..
pwd

echo -e "
llama.ccp installé !
"

./build/bin/llama-cli --list-devices



