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
      tailscale.enable = true;
    };
  };

  system = {
    primaryUser = "w";
    stateVersion = 6;
  };
}
