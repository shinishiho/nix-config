{ pkgs, ... }: {
  imports = [
    #./firefox.nix
    ./mpv.nix
    ./obs.nix
    #./thunderbird.nix
    ./zed.nix
    #./vscode.nix
  ];

  home.packages = with pkgs; [
    eagle
    gnome-software
    nekoray
    parsec-bin
  ];
}
