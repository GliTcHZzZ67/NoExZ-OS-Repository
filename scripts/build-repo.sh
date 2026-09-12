#!/bin/bash
set -e
cd "$(dirname "$0")/.."
cd x86_64
rm -f noexzos.db noexzos.files
rm -f noexzos.db.tar.gz.old noexzos.files.tar.gz.old
repo-add noexzos.db.tar.gz *.pkg.tar.zst
cp -f noexzos.db.tar.gz noexzos.db
cp -f noexzos.files.tar.gz noexzos.files
echo ""
echo "Repo DB updated. Total packages:"
ls *.pkg.tar.zst | wc -l
