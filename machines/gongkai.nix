{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "gongkai"; # Define your hostname.

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Easiest to use and most distros use this by default.

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
  # boot.extraModulePackages = [ (config.boot.kernelPackages.callPackage /home/j/gs-nix/gs.nix {}) ];
  # boot.kernelModules = [ "tenstorrent" ];


  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  systemd.mounts = [
    { where = "/dev/hugepages-1G";
      enable  = true;
      what  = "hugetlbfs";
      type  = "hugetlbfs";
      options = "pagesize=1G,mode=0777";
      before = [ "sysinit.target" ];
      wantedBy = [ "sysinit.target" ];
    }
  ];

  boot.initrd.availableKernelModules = [ "vmd" "xhci_pci" "ahci" "nvme" "thunderbolt" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.kernelParams = ["hugepagesz=1GB"
                       "hugepages=2"
                       "iommu=pt"
                       "nr_hugepages=2" ]; # for wormhole
  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.

  # networking.interfaces.eno3.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.graphics.enable = true;

  # hardware.nvidia = {
  #   nvidiaSettings = true;
  #   modesetting.enable = true;
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  #   powerManagement.finegrained = false;
  #   open = false;
  # };
}
