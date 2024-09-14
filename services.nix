{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [];

  services = {
    syncthing = {
      enable = true;
      user = "j";
      dataDir = "/home/j/syncthing";
      configDir = "/home/j/.config/syncthing";
    };

    printing.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
    };

    sunshine = {
      enable = true;
      openFirewall = true;
      capSysAdmin = true;
    };

    openssh.enable = true;

    tailscale.enable = true;

    vscode-server.enable = true;
  };
}
