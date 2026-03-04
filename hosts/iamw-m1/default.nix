{
  imports = [
    ../../modules/common
    ../../modules/darwin

    ./user.nix
  ];

  networking.hostName = "NakXKri";

  myModules = {
    darwin = {
      system.enable = true;
    };
  };

  system = {
    primaryUser = "w";
    stateVersion = 6;
  };
} 
