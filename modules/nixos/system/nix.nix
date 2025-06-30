{
  config,
  inputs,
  lib,
  ...
}:

let
  cfg = config.myModules.nixos.system.nix;
in
{
  config = lib.mkIf cfg.enable {
    nixpkgs.config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
          inherit pkgs;
        };
      };
    };

    nix =
      let
        flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
      in
      {
        settings = {
          auto-optimise-store = true;
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          flake-registry = "";
          nix-path = config.nix.nixPath;

          substituters = [
            "https://cache.nixos.org"
            "https://hyprland.cachix.org"
            "https://nix-community.cachix.org"
          ];
          trusted-substituters = [
            "https://cache.nixos.org"
            "https://hyprland.cachix.org"
            "https://nix-community.cachix.org"
          ];
          trusted-public-keys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          ];
        };

        channel.enable = false;

        registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
        nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
      };
  };
}
