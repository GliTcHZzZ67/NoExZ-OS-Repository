# NoExZOS Install Guide

Manual install (Arch-style, pure TTY). No GUI installer.

## Requirements

- NoExZOS Live USB **OR** any Linux live USB (Ubuntu/Debian/Arch)
- Target disk (min 8 GB)
- Internet connection (optional, for pacman)

## Steps

### 1. Boot live media

Boot NoExZOS USB or any Linux live USB.

### 2. Partition target disk

    fdisk /dev/sda
    # or: cfdisk /dev/sda

Create:
- `/dev/sda1` — EFI System Partition (512 MB, type EF00)
- `/dev/sda2` — Linux root (rest of disk, type 8300)

### 3. Format partitions

    mkfs.fat -F32 /dev/sda1
    mkfs.ext4 /dev/sda2

### 4. Mount

    mount /dev/sda2 /mnt
    mkdir -p /mnt/boot/efi
    mount /dev/sda1 /mnt/boot/efi

### 5. Download & extract rootfs

    wget -O /tmp/noexzos.tar.xz \
      https://github.com/GliTcHZzZ67/NoExZ-OS-Repository/releases/download/v1.0.0/noexzos-1.0-rootfs.tar.xz

    tar -xJpf /tmp/noexzos.tar.xz -C /mnt

### 6. Chroot

    mount --bind /dev  /mnt/dev
    mount --bind /proc /mnt/proc
    mount --bind /sys  /mnt/sys
    chroot /mnt /bin/bash

### 7. Configure system

    # Generate fstab
    blkid
    cat > /etc/fstab << FSTAB
    UUID=<root-uuid>   /          ext4   defaults  0 1
    UUID=<efi-uuid>    /boot/efi  vfat   umask=0077  0 2
    FSTAB

    # Hostname
    echo "noexz" > /etc/hostname

    # Timezone
    ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

    # Locale
    echo "LANG=en_US.UTF-8" > /etc/locale.conf

    # Root password
    passwd

    # Create user
    useradd -m -G users,wheel -s /bin/bash noexz
    passwd noexz

### 8. Install GRUB

    grub-install --target=x86_64-efi \
      --efi-directory=/boot/efi \
      --bootloader-id=NoExZOS

    grub-mkconfig -o /boot/grub/grub.cfg

### 9. Exit & reboot

    exit
    umount -R /mnt
    reboot

## Post-install

    # Install GUI (Wayland + Wayfire)
    pacman -Sy
    pacman -S wayfire wlroots mesa sddm
    systemctl enable sddm

## Troubleshooting

**Pacman 404?**
Update URL in `/etc/pacman.conf`:
    Server = https://glitchzzz67.github.io/NoExZ-OS-Repository/$arch

**GRUB not found?**
    pacman -S grub efibootmgr
