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

    # OCaml
    ocaml
    opam
    m4
    binutils-unwrapped

    # Coq
    coq_8_15

    # Rust
    rustup

    # Math
    # nix complains that this package is broken :(
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

    # icons
    papirus-icon-theme
    arc-theme
  ];

  # programs.fish.enable = true;
  programs.bash.enableCompletion = true;
  programs.ssh = {
    startAgent = true;
    agentTimeout = "1h";
  };

  programs.gnupg.agent.enable = true;
}
