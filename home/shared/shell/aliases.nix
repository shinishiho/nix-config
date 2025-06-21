# Common shell aliases and configurations
{ pkgs, ... }:

{
  home.shellAliases = {
    # ====================
    # Git Version Control
    # ====================
    g = "git";
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gp = "git push";
    gl = "git pull";
    gd = "git diff";
    gb = "git branch";
    gco = "git checkout";
    gcb = "git checkout -b";
    
    # ====================
    # File System & Navigation
    # ====================
    # Directory navigation
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    
    # Directory listing (eza replacements)
    l = "eza -la --group-directories-first";
    ls = "eza --group-directories-first";
    ll = "eza -l --group-directories-first";
    la = "eza -la --group-directories-first";
    lt = "eza --tree";
    
    # File operations with safety
    rm = "rm -i";
    cp = "cp -i";
    mv = "mv -i";
    mkdir = "mkdir -p";
    
    # ====================
    # Modern Tool Replacements
    # ====================
    cat = "bat";
    grep = "rg";
    find = "fd";
    ps = "procs";
    du = "dust";
    
    # ====================
    # Development & Editing
    # ====================
    v = "nvim";
    nixedit = "cd ~/nix-config && nvim .";
    
    # ====================
    # System & Utilities
    # ====================
    clr = "clear";
    ff = "fastfetch";
    reload-shell = "exec $SHELL";
    
    # ====================
    # Network Tools
    # ====================
    ping = "ping -c 5";
    wget = "wget -c";
    
    # ====================
    # Nix-specific aliases
    # ====================
    nix-shell = "nix-shell --run zsh";
    rebuild = "darwin-rebuild switch --flake .";
    rebuild-nixos = "sudo nixos-rebuild switch --flake .";
    home-switch = "home-manager switch --flake .";
    
    # ====================
    # Development Shortcuts
    # ====================
    dc = "docker-compose";
    k = "kubectl";
    tf = "terraform";
    
    # ====================
    # Quick Editing
    # ====================
    vim = "nvim";
    vi = "nvim";
    
    # ====================
    # Quick Directory Jumps
    # ====================
    cd = "z";
  };
}
