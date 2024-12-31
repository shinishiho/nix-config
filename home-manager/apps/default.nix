{ inputs, pkgs, ... }: {
  imports = [
    #./firefox.nix
    ./mpv.nix
    ./obs.nix
    #./thunderbird.nix
    ./zed.nix
    #./vscode.nix
  ];

  home.packages = with pkgs; [
    keypunch
    libreoffice
    nekoray
    parsec-bin
    pipeline
    gparted
    upscayl
    inputs.zen-browser.packages.${pkgs.system}.default
    inputs.nix-software-center.packages.${pkgs.system}.nix-software-center
  ];

  services.amberol.enable = true;
}
