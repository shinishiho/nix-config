{
  config,
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

    tealdeer

    zip
    unzip
    p7zip

    gemini-cli
    opencode

    curl
    wget

    (config.lib.nixGL.wrap localsend)

    libfido2
    pinentry-curses
    yubikey-manager

    android-tools

    gpu-screen-recorder-gtk

    (config.lib.nixGL.wrap caprine)
    (config.lib.nixGL.wrap vesktop)

    (config.lib.nixGL.wrap parsec-bin)
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
      enableSshSupport = false;
      pinentry.package = pkgs.pinentry-curses;
    };

    ssh-agent.enable = true;
  };

  home.persistence."/persistent".directories = [
    ".local/share/direnv"
    ".local/share/zoxide"
    ".gemini"
    ".gnupg"
    ".password-store"
    ".ssh"
  ];
}
