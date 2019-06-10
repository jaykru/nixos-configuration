{ pkgs, ... }:
{ environment.systemPackages = with pkgs; [
    stow
  ];

  let dotfiles = pkgs.callPackage ./dotfiles {};
  in
  { system.activationScripts.dotfiles = ''
    # TODO: make this path non-hardcoded
    stow ${dotfiles}/* -t /home/j
    '';
  }
}
