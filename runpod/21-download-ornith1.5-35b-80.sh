#!/usr/bin/env bash
#Petit script pour descendre sur runpode le modèle ornith1.5-35b-80 depuis huggingface_hub
#zf260609.1609, zf260830.1331

# source: https://huggingface.co/ornith-ai/Ornith-1.5-35B-A3B-GGUF/tree/main

#set -e -v -x
#set -v


cd /workspace/llama.cpp/
source .venv/bin/activate

shopt -s expand_aliases # Active les alias dans les scripts
alias huggingface-cli=hf

#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-35B-GGUF deepreinforce-ai_Ornith-1.0-35B-Q4_K_M.gguf --local-dir /workspace/models
#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-35B-GGUF mmproj-deepreinforce-ai_Ornith-1.0-35B-bf16.gguf --local-dir /workspace/models

#llama serve -hf ornith-ai/Ornith-1.5-35B-A3B-GGUF:Q4_K_M
#https://huggingface.co/ornith-ai/Ornith-1.5-35B-A3B-GGUF/resolve/main/Ornith-1.5-35B-Q4_K_M.gguf?download=true
#https://huggingface.co/ornith-ai/Ornith-1.5-35B-A3B-GGUF/resolve/main/Ornith-1.5-35B-Q8_0.gguf?download=true

#https://huggingface.co/ornith-ai/Ornith-1.5-35B-A3B-GGUF/resolve/main/mmproj-Ornith-1.5-35B-BF16.gguf?download=true

huggingface-cli download ornith-ai/Ornith-1.5-35B-A3B-GGUF Ornith-1.5-35B-Q8_0.gguf --local-dir /workspace/models
huggingface-cli download ornith-ai/Ornith-1.5-35B-A3B-GGUF mmproj-Ornith-1.5-35B-BF16.gguf --local-dir /workspace/models

