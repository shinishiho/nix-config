{
  pkgs,
  ...
}:
{
  imports = [
    # File manager with extensive configuration
    ./yazi.nix
  ];

  home.packages = with pkgs; [
    # File search and text processing
    ripgrep
    fd
    yq-go
    
    # System monitoring
    htop
    gotop
    procs

    # System information and disk usage
    duf     # df alternative
    du-dust # du alternative
    
    # Documentation
    tldr    # man alternative
  ];

  programs = {
    # JavaScript/Node.js runtime
    bun = {
      enable = true;
    };

    # Fuzzy finder
    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };
    
    # File navigation and display
    bat = {
      enable = true;
      config = {
        theme = "TwoDark";
        style = "numbers,changes,header";
      };
    };

    # Directory navigation
    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
      enableFishIntegration = true;
    };
    
    # Modern ls replacement
    eza = {
      enable = true;
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
      git = true;
      icons = "auto";
    };

    # Fun utility
    pay-respects.enable = true;
  };
}
