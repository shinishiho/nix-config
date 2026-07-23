{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    inputs.nix-index-database.homeModules.nix-index

    ./config/fastfetch
    ./config/fish
    ./config/nvim
    ./config/yazi

    # ./config/cava.nix
    ./config/claude-code.nix  # I'm sold
    # ./config/gemini-cli.nix
    # ./config/gh-dash.nix
    ./config/gh.nix
    ./config/git.nix
    # ./config/marimo.nix     # I'm done, bye
    ./config/shellAliases.nix
    ./config/ssh.nix
    ./config/starship.nix
    ./config/tealdeer.nix
    ./config/zellij.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    fd
    yq-go

    htop
    gotop
    procs

    duf
    dust

    zip
    unzip
    p7zip

    curl
    wget

    libfido2
    yubikey-manager

    android-tools
  ] ++ lib.optionals pkgs.stdenv.isDarwin [
      # mactop
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

    skim  = {
      enable = true;
    };

    gpg.enable = true;
    jq.enable = true;
    lazygit.enable = true;
    nh.enable = true;
    nix-index-database.comma.enable = true;
    nix-index.enable = true;
    password-store.enable = true;
    pay-respects.enable = true;

    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = false;
    defaultCacheTtl = 28800;
    maxCacheTtl = 28800;
  };

  services.ssh-agent.enable = lib.mkIf pkgs.stdenv.isLinux true;

  home.persistence."/persistent".directories = [
    ".local/share/direnv"
    ".local/share/zoxide"
    ".gnupg"
    ".password-store"
    ".ssh"
  ];
}
