{
  imports = [
    ../../../modules/common
    ../../../modules/nix-darwin

    ./users/w
  ];

  networking.hostName = "NakXKri";

  myModules = {
    common = {
      fonts.enable = true;
      tailscale.enable = true;
    };
    darwin = {
      system.enable = true;
      wm.enable = true;
      goodies = {
        enable = true;
      };
    };
  };

  system = {
    primaryUser = "w";
    stateVersion = 6;
  };
} 
