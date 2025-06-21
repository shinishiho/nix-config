# Development tools configuration
{ pkgs, ... }:

{
  imports = [
    ./containers.nix
    ./databases.nix
    ./networking.nix
    ./testing.nix
    ./monitoring.nix
    ./cloud.nix
  ];
  
  # General development tools
  home.packages = with pkgs; [
    # Text processing and analysis
    jq
    yq-go
    xmlstarlet
    
    # File transfer and sync
    rsync
    rclone
    
    # Archive tools
    unzip
    p7zip
    
    # System utilities
    htop
    tree
    watch
    
    # Process management
    tmux
    screen
    
    # Performance analysis
    hyperfine  # Command-line benchmarking
    tokei      # Code statistics
  ];
}
