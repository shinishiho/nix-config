{ inputs, pkgs, ... }: {
  imports = [
    #./firefox.nix
    ./mpv.nix
    ./obs.nix
    #./thunderbird.nix
    ./zed.nix
    #./vscode.nix
  ];

  home.packages = [
    pkgs.nekoray
    pkgs.parsec-bin
    pkgs.gparted
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}
