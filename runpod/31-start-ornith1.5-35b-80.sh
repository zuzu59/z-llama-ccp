#!/usr/bin/env bash
#Petit script pour démarrer le serveur llama.ccp avec le tout dernier ornith1.5:35b avec vision
#zf260608.1407, zf260830.1336

# source: 

# Download les modèles

#alias huggingface-cli=hf
#cd ~/dev/llama.cpp/
#source .venv/bin/activate
#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-9B-GGUF deepreinforce-ai_Ornith-1.0-9B-Q8_0.gguf --local-dir ~/models
#huggingface-cli download bartowski/deepreinforce-ai_Ornith-1.0-9B-GGUF mmproj-deepreinforce-ai_Ornith-1.0-9B-bf16.gguf --local-dir ~/models


cd /workspace/llama.cpp


./build/bin/llama-server \
  -m /workspace/models/Ornith-1.5-35B-Q8_0.gguf \
  --mmproj /workspace/models/mmproj-Ornith-1.5-35B-BF16.gguf \
  --host 0.0.0.0 \
  --port 8888 \
  -ngl 99 \
  -fit off \
  -c 262144 \
  -np 1 \
  -ctk q4_0 \
  -ctv q4_0 \
  --flash-attn on \
  -b 512 \
  -t 8 \
  --image-min-tokens 1024 \
  --spec-type draft-mtp \
  --spec-draft-n-max 2

exit


