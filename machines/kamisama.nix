{ config, pkgs, ... }:
{ imports = [
    ../hardware-configuration.nix
    ../users.nix
    ../services.nix
    # TODO: fix dotfile installation
    # ../dotfiles.nix
    ../nix.nix
    ../programs.nix
    ../networking.nix
    ../fonts.nix
    ../wayland.nix
    ../audio.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.supportedFilesystems = [ "zfs" ];

  time.timeZone = "America/Los_Angeles";

  system.stateVersion = "19.03";

  hardware.bluetooth.enable = true;
}
