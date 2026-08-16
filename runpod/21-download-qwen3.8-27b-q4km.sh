#!/usr/bin/env bash
#Petit script pour descendre sur runpode le modèle qwen 3.8:27b depuis huggingface_hub
#zf260609.1609, zf260816.1317

# source: https://www.reddit.com/r/LocalLLaMA/comments/1typjmc/120_toks_on_12gb_vram_with_gemma_4_12b_qat_mtp/?show=original

#set -e -v -x
#set -v


cd /workspace/llama.cpp/
source .venv/bin/activate

shopt -s expand_aliases # Active les alias dans les scripts
alias huggingface-cli=hf

# 1. Télécharger le fichier principal du modèle (Texte/Raisonnement)
#huggingface-cli download  bartowski/Qwen3.8-27B-Q4_K_M Qwen3.8-27B-Q4_K_M.gguf --local-dir /workspace/models
huggingface-cli download bartowski/Qwen3.8-27B-GGUF Qwen3.8-27B-Q4_K_M.gguf --local-dir /workspace/models

#llama serve -hf bartowski/Qwen3.8-27B-GGUF:Q4_K_M


# 2. Télécharger le projecteur visuel en version f16 (Multimodal / Vision)
#huggingface-cli download prithivMLmods/Qwen3.8-27B-GGUF Qwen3.8-27B.mmproj-f16.gguf --local-dir /workspace/models

exit



huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-35B-GGUF deepreinforce-ai_Ornith-1.0-35B-Q8_0.gguf --local-dir /workspace/models
huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-35B-GGUF mmproj-deepreinforce-ai_Ornith-1.0-35B-bf16.gguf --local-dir /workspace/models

