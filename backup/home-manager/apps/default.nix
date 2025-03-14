{ inputs, pkgs, ... }:
{
  imports = [
    #./firefox.nix
    ./mpv.nix
    #./obs.nix
    #./thunderbird.nix
    ./zed.nix
    ./vscode.nix
  ];

  services.easyeffects = {
    enable = true;
  };

  home.packages = with pkgs; [
    caprine
    gparted
    meld
    parsec-bin
    texliveBasic
    vivaldi
  ];
}
