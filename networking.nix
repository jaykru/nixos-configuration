{
  networking.networkmanager.enable = true;

  # for zfs
  networking.hostId = "deadbeef";

  # syncthing ports
  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
