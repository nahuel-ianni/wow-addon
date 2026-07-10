#!/usr/bin/env bash
set -euo pipefail

ADDON_NAME="A"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="$ROOT_DIR/.build/$ADDON_NAME"
CACHE_DIR="$ROOT_DIR/.build/cache/Ace3"

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR/Libs"
rsync -a "$ROOT_DIR/src/" "$BUILD_DIR/"

export L_STR=$(cd "$ROOT_DIR/src" && find locales -type f -name "*.lua" 2>/dev/null | tr '/' '\\' | sort || true)
export M_STR=$(cd "$ROOT_DIR/src" && find modules -type f -name "*.lua" 2>/dev/null | tr '/' '\\' | sort || true)
export F_STR=$(cd "$ROOT_DIR/src" && find framework -type f -name "*.lua" 2>/dev/null | tr '/' '\\' | sort || true)

perl -i -pe '
BEGIN { undef $/; }
s/\@LOCALES\@/$ENV{L_STR}/g;
s/\@FRAMEWORK\@/$ENV{F_STR}/g;
s/\@MODULES\@/$ENV{M_STR}/g;
' "$BUILD_DIR/$ADDON_NAME.toc"

for lib in \
    LibStub \
    CallbackHandler-1.0 \
    AceAddon-3.0 \
    AceEvent-3.0 \
    AceHook-3.0 \
    AceDB-3.0 \
    AceConfig-3.0 \
    AceConsole-3.0 \
    AceGUI-3.0 \
    AceLocale-3.0
do
    cp -R "$CACHE_DIR/$lib" "$BUILD_DIR/Libs/"
done