{ pkgs, ... }:
{ environment.systemPackages = with pkgs; [
    libreoffice
    signal-desktop
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
