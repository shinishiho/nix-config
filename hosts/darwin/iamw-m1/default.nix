{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew

    ../../../modules/shared/fonts.nix

    ../../../modules/darwin

    ./homebrew.nix
  ];

  networking.hostName = "NakXKri";

  users.users.w = {
    home = "/Users/w";
    name = "w";
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  nix.enable = false;
  nixpkgs.config.allowUnfree = true;

  system = {
    primaryUser = "w";
    stateVersion = 6;
  };
} 
