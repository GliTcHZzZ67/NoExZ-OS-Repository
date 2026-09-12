#!/bin/bash
set -e
cd "$(dirname "$0")/.."
PKG="$1"
[ -z "$PKG" ] && echo "Usage: $0 <package.pkg.tar.zst>" && exit 1
[ ! -f "$PKG" ] && echo "File not found: $PKG" && exit 1
cp -v "$PKG" x86_64/
./scripts/build-repo.sh
git add x86_64/
git commit -m "Add package: $(basename $PKG)"
git push
echo "Done!"
