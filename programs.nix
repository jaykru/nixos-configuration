{ pkgs, ... }:
{ environment.systemPackages = with pkgs; [
    # general
    which
    wget
    tmux
    tree
    emacs
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
    xdg_utils # for xdg-open
    usbutils

    # mail
    isync
    notmuch
    msmtp
    bogofilter

    git
    gitAndTools.hub
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

    # OCaml
    ocaml
    opam
    m4
    binutils-unwrapped

    # Coq
    coq_8_9

    # Rust
    rustup

    # Math
    sage

    # Complete trash
    clang
    gcc

    # Agda
    # (import ./programs/agda {})

    # Latex
    (texlive.combine {
      inherit (texlive) scheme-full;
    })
    aspell
    aspellDicts.en
  ];

  # use the correct shell
  programs.fish.enable = true;

  programs.ssh = {
    startAgent = true;
    agentTimeout = "1h";
  };

  programs.gnupg.agent.enable = true;
}
