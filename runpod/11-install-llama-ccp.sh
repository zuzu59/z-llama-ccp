#!/usr/bin/env bash
#Petit script pour installer le serveur llama.cpp sur runpod en copiant directement, sans compiler, le binaire depuis github
#Cette astuce permet de gagner 20 minutes de copilation
#zf260609.1606, zf260815.1135

# source: https://github.com/ai-dock/llama.cpp-cuda/releases


#set -e -v -x
#set -v -x
#set -v

export FOLDER_LLAMA="/workspace/llama.cpp/build/bin"
export VERSION_LLAMA="b10435"
export URL_GITHUB_LLAMA="https://github.com/ai-dock/llama.cpp-cuda/releases/download/$VERSION_LLAMA/llama.cpp-$VERSION_LLAMA-cuda-12.8-amd64.tar.gz"



mkdir -p $FOLDER_LLAMA
cd $FOLDER_LLAMA
wget $URL_GITHUB_LLAMA

tar -xzf llama* --no-same-owner
rm llama*
mv cuda-12.8/* ./

# On vérifie si le dossier de cache d'APT contient des fichiers de dépôts
if [ -n "$(ls -A /var/lib/apt/lists/ 2>/dev/null | grep -v 'partial')" ]; then
    echo ""
else
    apt-get update
fi


# superbe astuce de google ia pour avoir le bon path dans toutes les lib llama.cpp comme si on l'avait compilé sur cette machine
apt install -y patchelf

for f in $FOLDER_LLAMA/*; do
    if [ ! -d "$f" ]; then
        echo "Patch du RPATH ($ORIGIN) pour : $(basename "$f")"
        patchelf --force-rpath --set-rpath '$ORIGIN' "$f"
    fi
done



cd ../..
pwd

echo -e "
llama.cpp installé !
"

./build/bin/llama-cli --list-devices



