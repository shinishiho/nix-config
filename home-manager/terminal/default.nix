{ pkgs, ... }: {
  imports = [
    ./misc
    ./nvim
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
    miraclecast
    pipes-rs
    python3
    ripgrep
    trickle
    ueberzugpp
    uv
    yt-dlp
  ];
}
