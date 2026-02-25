#!/usr/bin/env bash
# Usage: ./pkgs/update-maa.sh [new-version]
# Without an argument, fetches the latest release version from GitHub.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAA_NIX="$SCRIPT_DIR/maa.nix"

if [[ $# -ge 1 ]]; then
  NEW_VERSION="$1"
else
  echo "Fetching latest MAA release from GitHub..."
  NEW_VERSION="$(curl -fsSL "https://api.github.com/repos/MaaAssistantArknights/MaaAssistantArknights/releases/latest" \
    | grep -oP '"tag_name":\s*"v\K[^"]+')"
  echo "Latest version: $NEW_VERSION"
fi

OLD_VERSION="$(grep -oP '(?<=version = ")[^"]+' "$MAA_NIX")"

if [[ "$OLD_VERSION" == "$NEW_VERSION" ]]; then
  echo "Already at v${NEW_VERSION}, nothing to do."
  exit 0
fi

URL="https://github.com/MaaAssistantArknights/MaaAssistantArknights/releases/download/v${NEW_VERSION}/MAA-v${NEW_VERSION}-linux-x86_64.AppImage"

echo "Fetching hash for MAA v${NEW_VERSION}..."
NEW_HASH="$(nix-prefetch-url --type sha256 "$URL" 2>/dev/null | tail -1 | xargs nix hash convert --hash-algo sha256 --to sri)"

echo "Updating $MAA_NIX"
echo "  $OLD_VERSION -> $NEW_VERSION"

sed -i \
  -e "s|version = \"${OLD_VERSION}\";|version = \"${NEW_VERSION}\";|" \
  -e "s|hash = \"[^\"]*\";|hash = \"${NEW_HASH}\";|" \
  "$MAA_NIX"

echo "Done. Verify with: nix build .#maa"
