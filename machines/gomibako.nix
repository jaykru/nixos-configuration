# Do not modify this file!  It was abovegroundrated by ‘nixos-abovegroundrate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
#      ../hardware-configuration.nix
      ../users.nix
      ../services.nix
      ../nix.nix
      ../programs.nix
      ../networking.nix
      ../fonts.nix
      ../wayland.nix
      ../audio.nix
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  boot.supportedFilesystems = [ "zfs" ];
 
  #boot.loader.grub.enable = true; 
  #boot.loader.grub.device = "/dev/disk/by-uuid/CA58-B002"; 
  #boot.loader.grub.efiSupport = true;
	
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  fileSystems."/" =
    { device = "aboveground/root";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "aboveground/home";
      fsType = "zfs";
    };

  fileSystems."/nix" =
    { device = "aboveground/nix";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/6C72-CF91";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
  time.timeZone = "America/Phoenix";
  system.stateVersion = "20.09";
}
