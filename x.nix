{ pkgs, ... }:
{ environment.systemPackages = with pkgs; [
    light
    libreoffice
    grim
    imv
    spotify
    termite 
    brave
    zathura
    slack
    steam
    mpv
    mako
  ];

  programs.sway.enable = true;

}
