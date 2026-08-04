#!/bin/bash
# Petit script pour sauvegarder le cache apt update
#zf260804.1427, zf260804.1713


mkdir -p /workspace/apt/lists
mkdir -p /workspace/apt/archives

rm -rf /var/lib/apt/lists
ln -s /workspace/apt/lists /var/lib/apt/lists
rm -rf /var/cache/apt/archives
ln -s /workspace/apt/archives /var/cache/apt/archives

apt update

