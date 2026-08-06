#!/usr/bin/env bash
#Petit script pour descendre sur runpode le modèle ornith1.0-35b-q4 depuis huggingface_hub
#zf260609.1609, zf260806.1814

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
alias huggingface-cli=hf

huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-35B-GGUF deepreinforce-ai_Ornith-1.0-35B-Q4_K_M.gguf --local-dir /workspace/models
huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-35B-GGUF mmproj-deepreinforce-ai_Ornith-1.0-35B-bf16.gguf --local-dir /workspace/models

exit






echo -e "
Pour descendre les modèles:

hf download google/gemma-4-12B-it-qat-q4_0-gguf gemma-4-12b-it-qat-q4_0.gguf --local-dir .

hf download unsloth/gemma-4-12B-it-qat-GGUF gemma-4-12B-it-qat-UD-Q4_K_XL.gguf --local-dir .
hf download Janvitos/gemma-4-12B-it-qat-assistant-MTP-Q8_0-GGUF gemma-4-12B-it-qat-assistant-MTP-Q8_0.gguf --local-dir .



cd /workspace/llama.cpp ; source .venv/bin/activate ; alias huggingface-cli=hf

#mkdir /workspace/models


huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-9B-GGUF deepreinforce-ai_Ornith-1.0-9B-Q8_0.gguf --local-dir /workspace/models
huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-9B-GGUF mmproj-deepreinforce-ai_Ornith-1.0-9B-bf16.gguf --local-dir /workspace/models

huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-35B-GGUF deepreinforce-ai_Ornith-1.0-35B-Q4_K_M.gguf --local-dir /workspace/models
huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-35B-GGUF mmproj-deepreinforce-ai_Ornith-1.0-35B-bf16.gguf --local-dir /workspace/models


huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-35B-GGUF --include "qwen2_vl_7b_instruct-mmproj-f16.gguf" --local-dir /workspace/models --local-dir-use-symlinks False




exit

huggingface-cli download unsloth/Qwen3.6-35B-A3B-GGUF Qwen3.6-35B-A3B-UD-Q3_K_M.gguf --local-dir .
huggingface-cli download unsloth/Qwen3.6-35B-A3B-GGUF  mmproj-F16.gguf --local-dir .





"

