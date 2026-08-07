#!/usr/bin/env bash
#Petit script pour démarrer le serveur llama.ccp avec le tout dernier qwen3.6 avec vision
#zf260608.1407, zf260621.1126

# source: 

# Pour la RTX 3090
#./build/bin/llama-server   -m gemma-4-12B-it-qat-UD-Q4_K_XL.gguf   --model-draft gemma-4-12B-it-qat-assistant-MTP-Q8_0.gguf   -ngl 99   -ngld 99   --spec-type draft-mtp   --spec-draft-n-max 4   --parallel 1   -c 65536   --flash-attn on   --temp 1.0   --top-p 0.95   --top-k 64   --port 8080   --host 0.0.0.0

cd ~/dev/llama.cpp


./build/bin/llama-server \
  -m ~/models/Qwen3.6-35B-A3B-UD-Q3_K_M.gguf \
  --mmproj ~/models/mmproj-F16.gguf \
  --parallel 1 \
  -c 262144 \
  --flash-attn on \
  -ngl 99 \
  --host 0.0.0.0 \
  --port 8080



