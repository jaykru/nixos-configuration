{ pkgs, ... }:

let my_vim = pkgs.vim_configurable.override { python = pkgs.python3; };

in { environment.systemPackages = with pkgs; [
    # vim
    #(import ./vim.nix)
    my_vim

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
    ncpamixer # replace pavucontrol which is broken on wayland 
    # tox clients
    qtox
    toxic
    cli-visualizer
    usbutils
    radare2
    
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
    python37Packages.pygments

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
