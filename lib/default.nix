# Shared library functions and utilities
{
  inputs,
  lib,
  nixpkgs,
}:

{
  # Helper function to create NixOS configurations
  mkNixosConfig = { system, hostname, username ? "w" }: nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; inherit (inputs.self) outputs; };
    modules = [
      ../hosts/nixos/${hostname}
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit inputs;
            inherit (inputs.self) outputs;
            platform = "linux";
          };
          users.${username} = {
            imports = [
              ../home/users/nixos.nix
            ];
          };
        };
      }
    ];
  };

  # Helper function to create Darwin configurations
  mkDarwinConfig = { system, hostname, username ? "w" }: inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit inputs; inherit (inputs.self) outputs; };
    modules = [
      ../hosts/darwin/${hostname}
      inputs.home-manager.darwinModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit inputs;
            inherit (inputs.self) outputs;
            platform = "darwin";
          };
          users.${username} = {
            imports = [
              ../home/users/darwin.nix
            ];
          };
        };
      }
    ];
  };
}
