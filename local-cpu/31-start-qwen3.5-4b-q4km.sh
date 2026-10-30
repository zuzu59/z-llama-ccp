#!/usr/bin/env bash
#Petit script pour démarrer le serveur llama.ccp avec le qwen3.5:4b
#zf260608.1407, zf260804.1550, zf261030.1458

# source: 

# Download les modèles

#alias huggingface-cli=hf
#cd ~/dev/llama.cpp/
#source .venv/bin/activate
#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-9B-GGUF deepreinforce-ai_Ornith-1.0-9B-Q8_0.gguf --local-dir ~/models
#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-9B-GGUF mmproj-deepreinforce-ai_Ornith-1.0-9B-bf16.gguf --local-dir ~/models


#cd /workspace/llama.cpp

~/.llama-app/llama serve \
  -m ./models/Qwen3.5-4B-Q4_K_M.gguf \
  --host 0.0.0.0 \
  --port 8888 \
  -ngl 0 \
  -c 32000 \
  -np 1 \
  -b 512 \
  -t 4 \
  --ctx-shift


exit


~/.llama-app/llama serve \
  -m ./models/Qwen3.5-4B-Q4_K_M.gguf \
  --host 0.0.0.0 \
  --port 8888 \
  -ngl 40 \
  -fit off \
  -c 32000 \
  -np 1 \
  -ctk q4_0 \
  -ctv q4_0 \
  --flash-attn on \
  -b 512 \
  -t 8

exit


