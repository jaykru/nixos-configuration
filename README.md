# NixOS Configuration
With handy full-service partitioning script. Forked from @aljce's original repo.

# Disk Partioning
/boot is unencrypted
All other partions are encrypted
```sh
NAME           SIZE   TYPE  MOUNTPOINT
nvme0n1          477G disk  
├─nvme0n1p1        1M part  
├─nvme0n1p2      512M part  /boot
└─nvme0n1p3    476.4G part  
  └─root       476.4G crypt 
    ├─zfs-root        zfs   /
    ├─zfs-nix         zfs   /nix
    └─zfs-home        zfs   /home
```

# Install
*WARNING* The following steps create an entire operating system this goes without saying but backup your data on the device you choose.
```sh
# Boot into nixos iso image
# Configure networking
nix-env --install git vim
git clone https://github.com/jaykru/nixos-configuration.git
./nixos-configuration/partition $DEVICE
cp -r nixos-configuration/* /mnt/etc/nixos
# Make personal changes to /mnt/etc/nixos/configuration.nix and other modules
nixos-install
```

