#!/usr/bin/env bash
#Petit script pour installer huggingface_hub
#zf260609.1609, zf260610.0931

# source: https://www.reddit.com/r/LocalLLaMA/comments/1typjmc/120_toks_on_12gb_vram_with_gemma_4_12b_qat_mtp/?show=original

cd ~/dev/llama.cpp

sudo apt update && sudo apt install -y python3-venv python3-pip
cd  ~/dev/llama.cpp/
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install huggingface_hub

hf auth login

echo -e "
Pour descendre les modèles:

hf download google/gemma-4-12B-it-qat-q4_0-gguf gemma-4-12b-it-qat-q4_0.gguf --local-dir .

hf download unsloth/gemma-4-12B-it-qat-GGUF gemma-4-12B-it-qat-UD-Q4_K_XL.gguf --local-dir .
hf download Janvitos/gemma-4-12B-it-qat-assistant-MTP-Q8_0-GGUF gemma-4-12B-it-qat-assistant-MTP-Q8_0.gguf --local-dir .

"

