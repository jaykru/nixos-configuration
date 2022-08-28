{ pkgs, ... }:
{ environment.systemPackages = with pkgs; [
    libreoffice
    signal-desktop
    grim
    lyx
    imv
    feh
    flameshot
    sxhkd
    kitty
    brave
    zathura
    steam
    celluloid
    mako
  ];

  services.xserver = {
    videoDrivers = [ "nvidia" ]; # use proprietary driver
    enable = true;
    desktopManager = {
      default = "gnome";
      xterm.enable = false;
      # plasma5.enable = true;
      gnome.enable = true;
    };

    libinput = {
      enable = true;
      clickMethod = "clickfinger";
      tapping = true;
      accelSpeed = "2";
    };

    displayManager = {
      gdm.enable = true;
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
      ];
    };

    xkbOptions = "ctrl:nocaps";
  };

  programs.sway = {
    enable = true;
    extraSessionCommands = ''
      export XKB_DEFAULT_OPTIONS=ctrl:nocaps,
      # xrdb -load $HOME/.Xresources
      '';
  };

  # light with SUID wrappers
  programs.light.enable = true;
}
