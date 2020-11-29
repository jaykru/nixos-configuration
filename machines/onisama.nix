{ config, lib, pkgs, ... }:
{ imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    #../hardware-configuration.nix
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

  boot = {
       initrd = {
       	 availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
	       kernelModules = [ ];
       };

       kernelPackages = pkgs.linuxPackages_latest;
       loader.systemd-boot.enable = true;
       supportedFilesystems = [ "zfs" ];
  };

  time.timeZone = "America/Los_Angeles";

  system.stateVersion = "19.03";

  hardware = {
    bluetooth.enable = true;
    bumblebee.enable = true;
    opengl.driSupport32Bit = true;
    pulseaudio.support32Bit = true;
  };
  
}
