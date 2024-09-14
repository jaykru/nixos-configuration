{ pkgs, ... }:
{ users = {
    # mutableUsers = false;
    defaultUserShell = pkgs.fish;
    users = { 
      j = {
        isNormalUser = true;
        extraGroups = [ "wheel"
                        "audio"
                        "networkmanager"
                        "sway"
                        "usb"
                        "video"
                        "adbusers"];
      };
    };
  };
}
