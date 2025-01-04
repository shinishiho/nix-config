{ inputs, pkgs, ... }: {
  imports = [
    #./firefox.nix
    ./mpv.nix
    # ./obs.nix
    #./thunderbird.nix
    ./zed.nix
    #./vscode.nix
  ];

  home.packages = with pkgs; [
    gparted
    libreoffice
    meld
    nekoray
    parsec-bin
    persepolis
    pipeline
    upscayl
    warp
    wike
    inputs.zen-browser.packages.${pkgs.system}.default
    inputs.nix-software-center.packages.${pkgs.system}.nix-software-center
  ];
}
