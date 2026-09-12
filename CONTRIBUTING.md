# Contributing

## Add a Package

1. Fork this repo
2. Build package: makepkg -si
3. Copy .pkg.tar.zst to x86_64/
4. Update repo DB:
     cd x86_64
     repo-add noexzos.db.tar.gz *.pkg.tar.zst
     cp -f noexzos.db.tar.gz noexzos.db
     cp -f noexzos.files.tar.gz noexzos.files
5. Commit and push
6. Open pull request

## Build Script

See scripts/build-repo.sh for automation.
