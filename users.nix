{ pkgs, ... }:
{ users = {
    # mutableUsers = false;
    defaultUserShell = pkgs.fish;
    users = { 
      j = {
        isNormalUser = true;
        hashedPassword = "password";
        extraGroups = [ "wheel" 
			"audio"
			"networkmanager"
			"sway"
			"usb" ];
      };
    };
  };
}
