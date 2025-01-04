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
    pipes-rs
    python3
    ripgrep
    trickle
    typioca
    ueberzugpp
    uv
    yt-dlp
  ];
}
