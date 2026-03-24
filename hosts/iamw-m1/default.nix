{ hostName, ... }:

{
  imports = [
    ../../modules/common
    ../../modules/darwin

    ./user.nix
  ];

  networking.hostName = hostName;

  myModules = {
    darwin = {
      goodies.enable = true;
      system.enable = true;
    };
    services = {
      tailscale.enable = false;
    };
  };

  system = {
    primaryUser = "w";
    stateVersion = 6;
  };
}
