#!/usr/bin/env bash
#Petit script pour démarrer le serveur llama.ccp avec le tout dernier qwen 3.8:27b avec vision
#zf260608.1407, zf260817.1202

# source: 

# Download les modèles

#alias huggingface-cli=hf
#cd ~/dev/llama.cpp/
#source .venv/bin/activate
#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-9B-GGUF deepreinforce-ai_Ornith-1.0-9B-Q8_0.gguf --local-dir ~/models
#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-9B-GGUF mmproj-deepreinforce-ai_Ornith-1.0-9B-bf16.gguf --local-dir ~/models




/workspace/llama.cpp/build/bin/llama-server \
  -m /workspace/models/Qwen3.8-27B.Q8_0.gguf \
  --mmproj /workspace/models/Qwen3.8-27B.mmproj-f16.gguf \
  --host 0.0.0.0 \
  --port 8888 \
  -ngl 60 \
  -c 262144 \
  -np 1 \
  -ctk f16 \
  -ctv f16 \
  --flash-attn on \
  -b 2048 \
  -t 8 \
  --image-min-tokens 1024 \
  --spec-type draft-mtp \
  --spec-draft-n-max 2

