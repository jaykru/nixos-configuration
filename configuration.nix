{ config, lib, pkgs, modulesPath, ... }:
let hostname = builtins.replaceStrings [ "\n" ] [ "" ] (builtins.readFile ./hostname);
in
{
  imports = [ (./machines + "/${hostname}.nix")
              "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
              "${builtins.fetchTarball "https://github.com/jaykru/tt-kmd/archive/main.tar.gz"}/tt-kmd.nix"
              ./disko-config.nix
              ./users.nix
              ./services.nix
              ./nix.nix
              ./programs.nix
              ./networking.nix
              ./fonts.nix
              ./gui.nix
              ./audio.nix
              (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master")
              ./systemd.nix
              ./cachix.nix ];
  networking.hostName = hostname;
  environment.variables.EDITOR = "emacs";

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.requestEncryptionCredentials = true;
  boot.zfs.package = pkgs.zfs_unstable;

  time.timeZone = "America/Los_Angeles";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    # enableSSHSupport = true;
  };

  virtualisation.containers.enable = true;

  # udev for a certain device
  services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="300c", TAG+="uaccess"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="1e71", ATTRS{idProduct}=="2012", TAG+="uaccess"
  '';

}
