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

    # mail
    isync
    notmuch
    msmtp

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

    # Battery
    acpi

    # Haskell
    # cabal2nix
    stack
    # stack2nix
    # haskellPackages.stylish-haskell

    # OCaml
    ocaml

    # Coq
    coq
    coqPackages.flocq

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
