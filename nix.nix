{ 
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
    # TODO: Apparently packageOverrides in config.nix is deprecated. Investigate alternatives.
#    packageOverrrides = pkgs: {
#    	vim_configurable = pkgs.vim_configurable.override { python = pkgs.python3; };
#    };
  };
}
