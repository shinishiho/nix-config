{
  config,
  lib,
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

    zip
    unzip
    p7zip

    curl
    wget

    (config.lib.nixGL.wrap localsend)

    libfido2
    yubikey-manager

    android-tools

    termpdfpy

    nil
    nixd

    # (config.lib.nixGL.wrap caprine)
    (config.lib.nixGL.wrap vesktop)
  ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      gpu-screen-recorder-gtk
      (config.lib.nixGL.wrap parsec-bin)
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
      stats
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
    password-store.enable = true;
    pay-respects.enable = true;

    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
      enableFishIntegration = true;
    };

  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = false;
    defaultCacheTtl = 28800;
    maxCacheTtl = 28800;
  };

  services.ollama.enable = true;
  services.gpg-agent.pinentry.package = lib.mkIf pkgs.stdenv.isLinux pkgs.pinentry-all;
  services.ssh-agent.enable = lib.mkIf pkgs.stdenv.isLinux true;

  home.persistence."/persistent".directories = [
    ".local/share/direnv"
    ".local/share/zoxide"
    ".gnupg"
    ".parsec"
    ".password-store"
    ".ssh"
  ];
}
