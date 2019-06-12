{ pkgs, ... }:
{ environment.systemPackages = with pkgs; [
  ];

 services = {
 	printing.enable = true;
	avahi.enable = true;
	avahi.nssmdns = true;
  };

}

