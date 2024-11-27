{ pkgs, ... }: {
  imports = [
    ./firefox.nix
    ./mpv.nix
    ./obs.nix
    #./thunderbird.nix
  ];

  home.packages = with pkgs; [
    eagle
    nekoray
    parsec-bin
  ];
}
