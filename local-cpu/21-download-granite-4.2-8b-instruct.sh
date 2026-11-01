#!/usr/bin/env bash
#Petit script pour descendre sur en local le modèle granite-4.2-8b-instruct depuis huggingface_hub
#zf260609.1609, zf260806.2004, zf261101.1139

# source: https://www.reddit.com/r/LocalLLaMA/comments/1typjmc/120_toks_on_12gb_vram_with_gemma_4_12b_qat_mtp/?show=original

#set -e -v -x
#set -v

source .venv/bin/activate
mkdir models
cd models

shopt -s expand_aliases # Active les alias dans les scripts
alias huggingface-cli=hf

#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-35B-GGUF deepreinforce-ai_Ornith-1.0-35B-Q4_K_M.gguf --local-dir /workspace/models
#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-35B-GGUF mmproj-deepreinforce-ai_Ornith-1.0-35B-bf16.gguf --local-dir /workspace/models

#huggingface-cli download unsloth/Qwen3.5-4B-GGUF Qwen3.5-4B-Q4_K_M.gguf --local-dir .
huggingface-cli download ibm-granite/granite-4.2-8b-GGUF granite-4.2-8b-Q4_K_M.gguf --local-dir .


