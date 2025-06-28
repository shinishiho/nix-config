{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew

    ../../../modules/darwin-modules.nix  # Import Darwin-specific modules

    ./homebrew.nix
  ];

  networking.hostName = "NakXKri";

  # Enable the modules that were previously imported directly
  my-modules = {
    shared.fonts.enable = true;
    darwin = {
      system.enable = true;
      wm.enable = true;
    };
  };

  users.users.w = {
    home = "/Users/w";
    name = "w";
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  # Global Nix and nixpkgs configuration
  nix.enable = false;
  nixpkgs.config.allowUnfree = true;

  system = {
    primaryUser = "w";
    stateVersion = 6;
  };
} 
