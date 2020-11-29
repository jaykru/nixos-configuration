{ pkgs, ... }:
{ users = {
    # mutableUsers = false;
    # defaultUserShell = pkgs.fish;
    users = { 
      j = {
        isNormalUser = true;
        password = "password";
        extraGroups = [ "wheel" 
			                  "audio"
			                  "networkmanager"
			                  "sway"
			                  "usb"
			                  "backlight"
			                  "video" ];
      };
    };
  };
}
