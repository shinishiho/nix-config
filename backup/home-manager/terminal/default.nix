{ pkgs, ... }:
{
  imports = [
    ./misc
    ./nvim
    ./scripts
    ./shell
    ./tools
  ];

  home.packages = with pkgs; [
    cmatrix
    fastfetch
    fd
    gcc14
    gotop
    jq
    nixd
    nixfmt-rfc-style
    nodejs_20
    pipes-rs
    python3
    ripgrep
    ueberzugpp
    uv
    yewtube
    yt-dlp
  ];
}
