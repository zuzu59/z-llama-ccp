#!/usr/bin/env bash
#Petit script pour démarrer le serveur llama.ccp avec le tout dernier gemma4:12b avec QAT et MTP
#zf260608.1407, zf260609.1557

# source: https://www.reddit.com/r/LocalLLaMA/comments/1typjmc/120_toks_on_12gb_vram_with_gemma_4_12b_qat_mtp/?show=original

# Pour la RTX 3090
#./build/bin/llama-server   -m gemma-4-12B-it-qat-UD-Q4_K_XL.gguf   --model-draft gemma-4-12B-it-qat-assistant-MTP-Q8_0.gguf   -ngl 99   -ngld 99   --spec-type draft-mtp   --spec-draft-n-max 4   --parallel 1   -c 65536   --flash-attn on   --temp 1.0   --top-p 0.95   --top-k 64   --port 8080   --host 0.0.0.0

# Pour la RTX 2080 sur Oculink

cd ~/dev/llama.cpp

./build/bin/llama-server \
  -m gemma-4-12B-it-qat-UD-Q4_K_XL.gguf \
  --model-draft gemma-4-12B-it-qat-assistant-MTP-Q8_0.gguf \
  -ngl 99 \
  -ngld 99 \
  --spec-type draft-mtp \
  --spec-draft-n-max 2 \
  -b 2048 \
  -ub 512 \
  -c 131072 \
  --flash-attn on \
  --parallel 1 \
  --temp 1.0 \
  --top-p 0.95 \
  --top-k 64 \
  --port 8080 \
  --host 0.0.0.0




