{ config, lib, pkgs, ... }:

{
  systemd.timers."set-kraken-gif" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "1m";
      Unit = "set-kraken-gif.service";
    };
  };

  systemd.services."set-kraken-gif" = {
    script = ''
    set -eu
    ${pkgs.liquidctl}/bin/liquidctl --match kraken initialize
    ${pkgs.liquidctl}/bin/liquidctl --match kraken set lcd screen gif /home/j/vaporwave.gif
    ${pkgs.liquidctl}/bin/liquidctl --match kraken set lcd screen brightness 2
  '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}
