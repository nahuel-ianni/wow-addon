#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CACHE_DIR="$ROOT_DIR/.build/cache"

mkdir -p "$CACHE_DIR"

if [[ ! -d "$CACHE_DIR/Ace3" ]]; then
    git clone --depth 1 https://github.com/WoWUIDev/Ace3.git "$CACHE_DIR/Ace3"
else
    git -C "$CACHE_DIR/Ace3" pull --ff-only
fi