# NoExZOS Repository

Official pacman repository + install media for **NoExZOS 1.0 (Sovereign)** — a minimal Linux distribution built from Linux From Scratch.

## 🚀 Quick Start

### 1. Add repo to pacman

Edit `/etc/pacman.conf`:

    [noexzos]
    SigLevel = Never
    Server = https://glitchzzz67.github.io/NoExZ-OS-Repository/$arch

### 2. Sync & install

    pacman -Sy
    pacman -S hello

## 📦 Available Packages

19 packages available. See `x86_64/` for full list.

- **Base:** bash, coreutils, tar, gzip, xz, bzip2
- **Editors:** nano, vim
- **Network:** curl, wget
- **Utilities:** tree, which, less, file, findutils, diffutils, patch
- **System:** htop, ncurses, libcap

## 💾 Install NoExZOS

Download rootfs tarball from [Releases](https://github.com/GliTcHZzZ67/NoExZ-OS-Repository/releases).

See [INSTALL.md](INSTALL.md) for detailed guide.

## 🛠️ For Developers

### Build package from source

    cd /path/to/source
    makepkg -si

### Add to repo

    cd x86_64
    repo-add noexzos.db.tar.gz *.pkg.tar.zst
    cp -f noexzos.db.tar.gz noexzos.db
    cp -f noexzos.files.tar.gz noexzos.files

## 📜 License

GPL-3.0
