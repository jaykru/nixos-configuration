{ pkgs, ... }:
{ environment.systemPackages = with pkgs; [
  ];

  services = {
        openssh.enable = true;
 	printing.enable = true;
	avahi.enable = true;
	avahi.nssmdns = true;
  };

}

