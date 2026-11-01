#!/usr/bin/env bash
#Petit script pour démarrer le serveur llama.ccp avec le phi-4-mini-instruct-Q4_K_M
#zf260608.1407, zf260804.1550, zf261101.1159

# source: 

# Download les modèles

#alias huggingface-cli=hf
#cd ~/dev/llama.cpp/
#source .venv/bin/activate
#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-9B-GGUF deepreinforce-ai_Ornith-1.0-9B-Q8_0.gguf --local-dir ~/models
#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-9B-GGUF mmproj-deepreinforce-ai_Ornith-1.0-9B-bf16.gguf --local-dir ~/models


#cd /workspace/llama.cpp

~/.llama-app/llama serve \
  -m ./models/microsoft_Phi-4-mini-instruct-Q4_K_M.gguf \
  --host 0.0.0.0 \
  --port 8888 \
  -c 32000 \
  -np 1 \
  -b 512 \
  -ub 512 \
  -t 8 \
  -tb 8 \
  --flash-attn off




exit

~/.llama-app/llama serve \
  -m ./models/granite-4.2-8b-Q4_K_M.gguf \
  --host 0.0.0.0 \
  --port 8888 \
  -c 32000 \
  -np 1 \
  -b 2048 \
  -ub 512 \
  -t 8 \
  -tb 8 \
  --flash-attn on



