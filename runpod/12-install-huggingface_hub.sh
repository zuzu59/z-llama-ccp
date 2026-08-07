#!/usr/bin/env bash
#Petit script pour descendre sur runpode le modèle ornith1.0-35b-q4 depuis huggingface_hub
#zf260609.1609, zf260806.2008

# source: https://www.reddit.com/r/LocalLLaMA/comments/1typjmc/120_toks_on_12gb_vram_with_gemma_4_12b_qat_mtp/?show=original

#set -e -v -x
set -v

#sudo apt update && sudo apt install -y python3-venv python3-pip

cd /workspace/llama.cpp/
python3 -m venv .venv
source .venv/bin/activate
#	pip install --upgrade pip
pip install huggingface_hub

hf auth login

