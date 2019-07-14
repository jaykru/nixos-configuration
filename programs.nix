{ pkgs, ... }:

let my_vim = pkgs.vim_configurable.override { python = pkgs.python3; };

in { environment.systemPackages = with pkgs; [
    # vim
    #(import ./vim.nix)
    my_vim

    # general
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
    xdg_utils # for xdg-open
    usbutils
    radare2

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

    # Python
    python3

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
  ];

  # programs.fish.enable = true;
  programs.bash.enableCompletion = true;

  programs.ssh = {
    startAgent = true;
    agentTimeout = "1h";
  };

  programs.gnupg.agent.enable = true;
}
