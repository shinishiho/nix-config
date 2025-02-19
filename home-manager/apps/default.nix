{ inputs, pkgs, ... }:
{
  imports = [
    #./firefox.nix
    ./mpv.nix
    #./obs.nix
    #./thunderbird.nix
    #./zed.nix
    ./vscode.nix
  ];

  services.easyeffects = {
    enable = true;
  };

  home.packages = with pkgs; [
    caprine
    gparted
    meld
    nekoray
    parsec-bin
    texliveBasic
    vivaldi
    wike
  ];
}
