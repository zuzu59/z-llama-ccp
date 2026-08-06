#!/usr/bin/env bash
#Petit script pour installer le serveur llama.ccp sur runpod en copiant directement, sans compiler, le binaire depuis github
#Cette astuce permet de gagner 20 minutes de copilation
#zf260609.1606, zf260806.1715

# source: https://github.com/ai-dock/llama.cpp-cuda/releases


#set -e -v -x
#set -v -x

export FOLDER_LLAMA="/workspace/llama.ccp/build/bin"
export VERSION_LLAMA="b10290"
export URL_GITHUB_LLAMA="https://github.com/ai-dock/llama.cpp-cuda/releases/download/$VERSION_LLAMA/llama.cpp-$VERSION_LLAMA-cuda-12.8-amd64.tar.gz"



mkdir -p $FOLDER_LLAMA
cd $FOLDER_LLAMA
wget $URL_GITHUB_LLAMA

tar -xzf llama* --no-same-owner
mv cuda-12.8/* ./

# superbe astuce de google ia pour avoir le bon path dans toutes les lib llama.ccp comme si on l'avait compilé sur cette machine

apt-get update && apt-get install -y patchelf

for f in /workspace/llama.ccp/build/bin/*; do
    if [ ! -d "$f" ]; then
        echo "Patch du RPATH ($ORIGIN) pour : $(basename "$f")"
        patchelf --force-rpath --set-rpath '$ORIGIN' "$f"
    fi
done


cd ../..
pwd

echo -e "

Llama.ccp installé avec comme devices:

"

./build/bin/llama-cli --list-devices


exit


git clone https://github.com/ggml-org/llama.cpp
cd llama.cpp
git pull


#apt update && apt install -y build-essential cmake git nvidia-cuda-toolkit
#apt update ; apt install -y ninja-build

#cmake -B build -G Ninja -DGGML_CUDA=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_CUDA_FLAGS=
#cmake --build build --config Release

#cmake -B build -DGGML_CUDA=ON
#cmake --build build --config Release -j
#./build/bin/llama-cli --list-devices

#cmake -B build -G Ninja -DGGML_CUDA=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_CUDA_FLAGS=
cmake -B build -DGGML_CUDA=ON
#cmake --build build --config Release
cmake --build build --config Release -j$(nproc)

./build/bin/llama-cli --list-devices

