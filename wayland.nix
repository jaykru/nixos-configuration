{ pkgs, ... }:
{ environment.systemPackages = with pkgs; [
    libreoffice
    signal-desktop
    grim
    imv
    feh
    scrot
    sxhkd
    spotify
    termite 
    brave
    zathura
    steam
    mpv
    mako
  ];

  services.xserver = {
	videoDrivers = [ "nvidia" ]; # use propreitary driver
	enable = true;
	desktopManager = {
		default = "none";
		xterm.enable = false;
	};

	libinput = {
		 enable = true;
		 clickMethod = "clickfinger";
		 tapping = false;
		 accelSpeed = "2";
	};

	displayManager = {
		startx.enable = true;
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
