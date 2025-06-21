{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # Archives
    zip
    unzip
    p7zip
    
    # Text processing
    yq-go
    ripgrep
    fd
    
    # Network tools
    curl
    wget
    
    # System monitoring
    htop
    
    # Modern alternatives to classic tools
    du-dust # du
    procs   # ps
    tldr    # man
  ];

  programs = {
    # Nix tools
    nix-index-database.comma.enable = true;
    nix-index.enable = true;
    nh.enable = true;

    # Development environment
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    # Text processing and data tools
    jq = {
      enable = true;
    };
    
    bat = {
      enable = true;
      config = {
        theme = "TwoDark";
        style = "numbers,changes,header";
      };
    };

    # Navigation and file management
    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
      enableFishIntegration = true;
    };
    
    eza = {
      enable = true;
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
      git = true;
      icons = "auto";
    };

    # System monitoring
    # btop.enable = true; # Uncomment if you want to use btop for system monitoring
  };
}
