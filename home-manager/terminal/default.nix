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
    pipes-rs
    python3
    ripgrep
    typioca
    ueberzugpp
    uv
    yewtube
    yt-dlp
  ];
}
