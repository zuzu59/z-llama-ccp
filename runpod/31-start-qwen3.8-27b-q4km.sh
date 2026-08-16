#!/usr/bin/env bash
#Petit script pour démarrer le serveur llama.ccp avec le tout dernier qwen 3.8:27b avec vision
#zf260608.1407, zf260816.1926

# source: 

# Download les modèles

#alias huggingface-cli=hf
#cd ~/dev/llama.cpp/
#source .venv/bin/activate
#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-9B-GGUF deepreinforce-ai_Ornith-1.0-9B-Q8_0.gguf --local-dir ~/models
#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-9B-GGUF mmproj-deepreinforce-ai_Ornith-1.0-9B-bf16.gguf --local-dir ~/models


cd /workspace/llama.cpp

./build/bin/llama-server \
  -m /workspace/models/Qwen3.8-27B-Q4_K_M.gguf \
  --mmproj /workspace/models/mmproj-Qwen3.8-27B-f16.gguf \
  --host 0.0.0.0 \
  --port 8888 \
  -ngl 90 \
  -fit off \
  -c 262144 \
  -np 1 \
  -ctk f16 \
  -ctv f16 \
  --flash-attn on \
  -b 2048 \
  -t 8



exit




./build/bin/llama-server \
  -m /workspace/models/deepreinforce-ai_Ornith-1.0-35B-Q8_0.gguf \
  --mmproj /workspace/models/mmproj-deepreinforce-ai_Ornith-1.0-35B-bf16.gguf \
  --host 0.0.0.0 \
  --port 8888 \
  -ngl 90 \
  -fit off \
  -c 262144 \
  -np 1 \
  -ctk f16 \
  -ctv f16 \
  --flash-attn on \
  -b 2048 \
  -t 8

exit


