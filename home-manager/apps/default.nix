{ pkgs, ... }: {
  imports = [
    ./firefox.nix
    ./mpv.nix
    #./thunderbird.nix
  ];

  home.packages = with pkgs; [
    nekoray
    parsec-bin
    uxplay
  ];
}
