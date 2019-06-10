{ pkgs, ... }:
{ environment.systemPackages = with pkgs; [
    termite 
    alacritty
    # haskellPackages.xmobar
    feh
    brave
    firefox
    rofi 
    zathura
    xorg.xinit
    xorg.xmodmap
    # xorg.mkfontdir
    # xorg.mkfontscale
    slack
    mpv
    mako
  ];

#  services = {
#  	xserver = {
#		enable = true;
#		layout = "us";
#		windowManager = {
#			xmonad.enable = true;
#			xmonad.enableContribAndExtras = true;
#		};
#		libinput.enable = true;
#		
#	};
#  };

  programs.sway.enable = true;

}
