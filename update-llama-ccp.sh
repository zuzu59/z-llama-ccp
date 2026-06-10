#!/usr/bin/env bash
#Petit script pour updater le serveur llama.ccp avec le tout dernier gemma4:12b avec QAT et MTP pour une RTX 2080 avec seulement 8GB de RAM sur le CPU
#zf260609.1603, zf260610.0914

# source: https://www.reddit.com/r/LocalLLaMA/comments/1typjmc/120_toks_on_12gb_vram_with_gemma_4_12b_qat_mtp/?show=original

cd ~/dev/llama.cpp
git pull

cmake -B build -G Ninja -DGGML_CUDA=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_CUDA_FLAGS=
cmake --build build --config Release

echo -e "
Compilation terminée !

"

./build/bin/llama-cli --list-devices

