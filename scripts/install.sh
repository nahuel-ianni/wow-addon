#!/usr/bin/env bash
set -euo pipefail

ADDON_NAME="A"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="$ROOT_DIR/.build/$ADDON_NAME"

WOW_PATH="${WOW_PATH:-/Applications/World of Warcraft/_retail_/Interface/AddOns/$ADDON_NAME}"

mkdir -p "$WOW_PATH"

rsync -a --delete \
    "$BUILD_DIR/" \
    "$WOW_PATH/"