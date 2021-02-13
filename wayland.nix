{ config, pkgs, ... }:
let desktop_switch = true; # true -> gnome 3; false -> plasma5
in 
{ environment.systemPackages = with pkgs; [
    libreoffice
    signal-desktop
    grim
    lyx
    imv
    feh
    scrot
    sxhkd
    spotify
    termite 
    brave
    deadbeef
    zathura
    steam
    mpv
    mako
  ];

  services.xserver = {
    enable = true;

    videoDrivers = [ "nouveau" ];

    desktopManager = {
                xterm.enable = false;
                gnome3.enable = desktop_switch;
                plasma5.enable = if desktop_switch then false else true;
	};

      	libinput = {
		 enable = true;
	};

	displayManager = {
              #startx.enable = true; # if desktop_switch then false else true;
             # sddm.enable = true;
              gdm.enable = desktop_switch;
              gdm.nvidiaWayland = desktop_switch;
              # defaultSession = if desktop_switch then "gnome" else "sway";
              #setupCommands = ''xrandr --output HDMI-0 --scale 1.33x1.33\n xrandr --output HDMI-1 --scale 1.33x1.33'';
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

  programs.steam.enable = true;
}
