{ inputs, pkgs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.default

    ./apps
    #./wm
    ./de
    ./terminal
  ];

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };
  };

  home = {
    username = "w";
    homeDirectory = "/home/w";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
