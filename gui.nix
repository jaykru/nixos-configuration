{ pkgs, ... }:
{ environment.systemPackages = with pkgs; [
    libreoffice
    signal-desktop
    grim
    lyx
    imv
    feh
    flameshot
    kitty
    brave
    zathura
    steam
    vlc
    mako
    librewolf
    discord
    gimp
    rofi
    plasma-pass
  ];

  services.displayManager = {
   sddm.enable = true;
   defaultSession = "plasmax11";
  };
  services.desktopManager.plasma6.enable = true;

  # services.libinput = {
  #     enable = true;
  #     clickMethod = "clickfinger";
  #     tapping = true;
  #     accelSpeed = "2";
  # };

  services.xserver = {
    enable = true;
    # videoDrivers = [ "nvidia" ];

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
      ];
    };

    xkb.options = "ctrl:nocaps";
  };

  # light with SUID wrappers
  programs.light.enable = true;
}
