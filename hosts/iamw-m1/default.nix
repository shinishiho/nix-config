{
  imports = [
    ../../modules/common
    ../../modules/darwin

    ./user.nix
  ];

  networking.hostName = "NakXKri";

  myModules = {
    common = {
      fonts.enable = true;
      tailscale.enable = true;
    };
    darwin = {
      system.enable = true;
    };
  };

  system = {
    primaryUser = "w";
    stateVersion = 6;
  };
} 
