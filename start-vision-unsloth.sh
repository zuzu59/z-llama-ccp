#!/usr/bin/env bash
#Petit script pour démarrer le serveur llama.ccp avec le tout dernier gemma4:12b de unsloth mais avec la possibilité de vision d'images et optimisé pour la RTX 20280 11GB/7GB !
#zf260608.1407, zf260611.0910

# source: https://www.reddit.com/r/LocalLLaMA/comments/1typjmc/120_toks_on_12gb_vram_with_gemma_4_12b_qat_mtp/?show=original

cd ~/dev/llama.cpp

./build/bin/llama-server \
  -m gemma-4-12B-it-qat-UD-Q4_K_XL.gguf \
  --mmproj mmproj-BF16.gguf \
  -c 128000 \
  -ngl 99 \
  -ctk q8_0 \
  -ctv q8_0 \
  -kvu \
  --no-mmap \
  --flash-attn on \
  --parallel 1 \
  --temp 1.0 \
  --top-p 0.95 \
  --top-k 64 \
  --port 8080 \
  --host 0.0.0.0
