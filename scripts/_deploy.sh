#!/usr/bin/env bash
set -euo pipefail

ADDON_NAME="A"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="$ROOT_DIR/.build/$ADDON_NAME"
WOW_PATH="/Applications/World of Warcraft/_retail_/Interface/AddOns/$ADDON_NAME"
TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TEMP_DIR"' EXIT

rm -rf "$ROOT_DIR/.build" && mkdir -p "$BUILD_DIR/Libs"
rsync -a "$ROOT_DIR/src/" "$BUILD_DIR/"

# Generate clean, relative newline-separated lists
export L_STR=$(cd "$ROOT_DIR/src" && ls locales/*.lua 2>/dev/null || true)
export M_STR=$(cd "$ROOT_DIR/src" && ls modules/*.lua 2>/dev/null || true)

# In-place placeholder replacement using Perl (native on macOS)
perl -i -pe 's/\@LOCALES\@/$ENV{L_STR}/g; s/\@MODULES\@/$ENV{M_STR}/g' "$BUILD_DIR/$ADDON_NAME.toc"

git clone --quiet --depth 1 "https://github.com/WoWUIDev/Ace3.git" "$TEMP_DIR"
for lib in LibStub CallbackHandler-1.0 AceAddon-3.0 AceEvent-3.0 AceHook-3.0 AceDB-3.0 AceConfig-3.0 AceConsole-3.0 AceGUI-3.0 AceLocale-3.0; do
  [[ -d "$TEMP_DIR/$lib" ]] && cp -R "$TEMP_DIR/$lib" "$BUILD_DIR/Libs/"
done

mkdir -p "$WOW_PATH" && rsync -a --delete "$BUILD_DIR/" "$WOW_PATH/"