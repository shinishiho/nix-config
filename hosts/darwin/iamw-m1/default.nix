{
  pkgs,
  ...
}:
{
  imports = [
    ../../../modules/darwin-modules.nix
  ];

  networking.hostName = "NakXKri";

  myModules = {
    shared.fonts.enable = true;
    darwin = {
      system.enable = true;
      wm.enable = true;
      goodies = {
        enable = true;
        tailscale.enable = true;
      };
    };
  };

  users.users.w = {
    home = "/Users/w";
    name = "w";
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  system = {
    primaryUser = "w";
    stateVersion = 6;
  };
} 
