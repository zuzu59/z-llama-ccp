#!/usr/bin/env bash
#Petit script pour installer le serveur llama.ccp avec le tout dernier gemma4:12b avec QAT et MTP pour une RTX 3090 avec beaucoup de RAM sur le CPU
#zf260609.1606

# source: https://www.reddit.com/r/LocalLLaMA/comments/1typjmc/120_toks_on_12gb_vram_with_gemma_4_12b_qat_mtp/?show=original

cd ~/dev
git clone https://github.com/ggml-org/llama.cpp
cd llama.cpp
apt update && apt install -y build-essential cmake git nvidia-cuda-toolkit
apt update ; apt install -y ninja-build

#cmake -B build -G Ninja -DGGML_CUDA=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_CUDA_FLAGS=
#cmake --build build --config Release

cmake -B build -DGGML_CUDA=ON
cmake --build build --config Release -j
./build/bin/llama-cli --list-devices


