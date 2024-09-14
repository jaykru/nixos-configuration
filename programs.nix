{ pkgs, ... }:

{ environment.systemPackages = with pkgs; [
    # general
    bc
    file
    which
    wget
    tmux
    tree
    emacs
    ripgrep
    python3
    rtorrent
    parted
    unzip
    tcpdump
    neovim
    stow
    gnumake
    ledger
    keybase
    imagemagick
    htop
    lsof
    xdg_utils # for xdg-open
    pavucontrol # replace pavucontrol which is broken on wayland
    cli-visualizer
    qbittorrent
    usbutils
    radare2
    udiskie

    # android mtp
    jmtpfs
    
    pkg-config # finding ssl

    # mail
    isync
    notmuch
    msmtp
    bogofilter

    gitAndTools.gitFull
    gist

    # Encryption
    pass
    gnupg
    openssl

    # Nix
    # nix-prefetch-scripts

    # Fun
    cmatrix
    nethack

    # Battery
    acpi

    # Haskell
    # cabal2nix
    stack
    # stack2nix
    # haskellPackages.stylish-haskell

    # lisp
    sbcl

    # OCaml
    ocaml
    opam
    m4
    binutils-unwrapped

    # Coq
    coq_8_15

    # Rust
    cargo
    rustc

    # Math
    # nix complains that this package is broken :(
    sage

    # Complete trash
    clang
    gcc

    # Python
    python3
    conda

    # Agda
    # (import ./programs/agda {})

    # Latex
    (texlive.combine {
      inherit (texlive) scheme-full;
    })
    aspell
    aspellDicts.en

    # bash completions
    nix-bash-completions

    # icons
    # papirus-icon-theme
    arc-theme

    liquidctl

    cachix
  ];

  nixpkgs.overlays = [ (self: super: {
      liquidctl = super.liquidctl.overrideAttrs (oldAttrs: {
          version = "0.0";
          src = super.fetchFromGitHub {
              owner = "liquidctl";
              repo = "liquidctl";
              rev = "d343c0d";
              sha256 = "sha256-2iiz8Cc3KYP2VZOGdmCG6b4CnGa3BOshZpmm+pM91SE="; # We'll get the correct hash from the error message
          };
          patches = [];
      });
  }) ];

  programs.fish.enable = true;
  # programs.bash.enableCompletion = true;
  programs.ssh = {
    startAgent = true;
    agentTimeout = "1h";
  };

  programs.kdeconnect.enable = true;
  programs.adb.enable = true;
  programs.gnupg.agent.enable = true;
  programs.nix-ld.enable = true;
}
