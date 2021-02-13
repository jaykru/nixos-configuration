{ pkgs, ... }:

let my_vim = pkgs.vim_configurable.override { python = pkgs.python3; };
nix.extraOptions = ''
      experimental-features = nix-command
   '';
# this is required until nix 2.4 is released
nix.package = pkgs.nixUnstable;
  
in { environment.systemPackages = with pkgs; [
   # vim
    #(import ./vim.nix)
    my_vim

    # manpages
    manpages

    # general
    bc
    p7zip
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
    ncpamixer # pavucontrol is broken on wayland 
    pavucontrol 
    cli-visualizer
    usbutils
    radare2
    ghidra-bin
    udiskie
    nmap
    traceroute

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
    coq_8_11

    # Rust
    rustup

    # Math
    # nix complains that this package is broken :(
    # sage

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

  # install manpages when possible
  documentation.dev.enable = true;
}
