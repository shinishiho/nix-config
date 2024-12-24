{ pkgs, ... }: {
  imports = [
    ./misc
    ./nvim
    ./shell
    ./tools
  ];

  home.packages = with pkgs; [
    ani-cli
    cmatrix
    fastfetch
    fd
    gcc
    gtop
    iotop
    iw
    jq
    mosh
    nethogs
    pciutils
    pipes-rs
    python3
    ripgrep
    trickle
    uv
  ];

  programs = {

    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };

  };
}
