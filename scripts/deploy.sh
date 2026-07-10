#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "${1:-}" == "full" ]]; then
    "$ROOT_DIR/dependencies.sh"
fi

"$ROOT_DIR/build.sh"
"$ROOT_DIR/install.sh"