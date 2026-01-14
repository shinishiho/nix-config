{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    ripgrep
    fd
    yq-go
    
    htop
    gotop
    procs

    duf
    dust
    
    tldr

    ariang

    zip
    unzip
    p7zip

    gemini-cli

    curl
    wget
    
    localsend

    libfido2
    pinentry-curses

    android-tools

    # inputs.helium.defaultPackage.${stdenv.hostPlatform.system}
  ];

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "TwoDark";
        style = "numbers,changes,header";
      };
    };
    
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
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

    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };

    gpg.enable = true;
    jq.enable = true;
    lazygit.enable = true;
    nh.enable = true;
    nix-index-database.comma.enable = true;
    nix-index.enable = true;
    pay-respects.enable = true;
    ssh.enable = true;

    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
      enableFishIntegration = true;
    };

  };

  services = {
    gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry-curses;
    };
  };
    
  home.persistence."/persistent".directories = [
    ".local/share/direnv"
    ".local/share/zoxide"
    ".gemini"
    ".gnupg"
    ".ssh"
  ];
}
