# Nix development environment
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Nix tools
    nix-prefetch-git
    nix-tree
    nix-du
    
    # Formatting and linting
    nixpkgs-fmt
    statix
    deadnix
    
    # Language servers
    nil  # Nix language server
    
    # Documentation
    manix
  ];
}
