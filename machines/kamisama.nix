{ config, pkgs, ... }:
{ imports = [
    ../hardware-configuration.nix
    ../users.nix
    # TODO: fix dotfile installation
    # ../dotfiles.nix
    ../programs.nix
    ../networking.nix
    ../nix.nix
    ../fonts.nix
    ../x.nix
    ../audio.nix
  ];
  # TODO: look into switching to systemd-boot?
  boot.loader.systemd-boot.enable = true;
  boot.supportedFilesystems = [ "zfs" ];
  # boot.loader.grub.version = 2;
  # TODO: unsure if needed
  # boot.loader.grub.zfsSupport = true;
  # boot.loader.grub.device = "/dev/nvme0n1";
  # boot.supportedFilesystems = [ "zfs" ];
  # boot.initrd.luks.devices = [
  #  { name = "root";
  #    device = "/dev/nvme0n1p3";
  #  }
  #];

  time.timeZone = "America/Los_Angeles";

  system.stateVersion = "19.03";

  hardware.bluetooth.enable = true;
}
