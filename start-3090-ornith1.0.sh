#!/usr/bin/env bash
#Petit script pour démarrer le serveur llama.ccp avec le tout dernier ornith1.0:9b avec vision
#zf260608.1407, zf260713.1545

# source: 

# Download les modèles

#alias huggingface-cli=hf
#cd ~/dev/llama.cpp/
#source .venv/bin/activate
#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-9B-GGUF deepreinforce-ai_Ornith-1.0-9B-Q8_0.gguf --local-dir ~/models
#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-9B-GGUF mmproj-deepreinforce-ai_Ornith-1.0-9B-bf16.gguf --local-dir ~/models


cd ~/dev/llama.cpp

./build/bin/llama-server \
  -m ~/models/deepreinforce-ai_Ornith-1.0-35B-Q4_K_M.gguf \
  --mmproj ~/models/mmproj-deepreinforce-ai_Ornith-1.0-35B-bf16.gguf \
  --host 0.0.0.0 \
  --port 8080 \
  -ngl 99 \
  -c 131072 \
  -ctk q4_0 \
  -ctv q4_0 \
  --flash-attn on \
  -b 2048 \
  -t 8


exit

./build/bin/llama-server \
  -m ~/models/deepreinforce-ai_Ornith-1.0-9B-Q8_0.gguf \
  --mmproj ~/models/mmproj-deepreinforce-ai_Ornith-1.0-9B-bf16.gguf \
  --port 8080 \
  --host 0.0.0.0 \
  -ngl 99 \
  -c 262144 \
  -ctk q4_0 \
  -ctv q4_0 \
  --flash-attn on \
  -b 2048 \
  -t 8



exit




./build/bin/llama-server \
  -m ~/models/Qwen3.6-35B-A3B-UD-Q3_K_M.gguf \
  --mmproj ~/models/mmproj-F16.gguf \
  --parallel 1 \
  -c 262144 \
  --flash-attn on \
  -ngl 99 \
  --host 0.0.0.0 \
  --port 8080



