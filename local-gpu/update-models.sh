#!/usr/bin/env bash
#Petit script pour passer les updates de modèles huggingface_hub
#zf260609.1609, zf260611.0931

# source: https://www.reddit.com/r/LocalLLaMA/comments/1typjmc/120_toks_on_12gb_vram_with_gemma_4_12b_qat_mtp/?show=original

cd ~/dev/llama.cpp

source .venv/bin/activate


# Pour les originaux de Goole
hf download google/gemma-4-12B-it-qat-q4_0-gguf gemma-4-12b-it-qat-q4_0.gguf --local-dir .
hf download google/gemma-4-12B-it-qat-q4_0-gguf mmproj-gemma-4-12b-it-qat-q4_0.gguf --local-dir .


# Pour les modified de Unsolth
hf download unsloth/gemma-4-12B-it-qat-GGUF gemma-4-12B-it-qat-UD-Q4_K_XL.gguf --local-dir .
hf download Janvitos/gemma-4-12B-it-qat-assistant-MTP-Q8_0-GGUF gemma-4-12B-it-qat-assistant-MTP-Q8_0.gguf --local-dir .

