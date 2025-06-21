# Shared library functions and utilities
{ inputs, nixpkgs, lib }:

{
  # Helper function to create NixOS configurations
  mkNixosConfig = { system, hostname, username ? "w" }: nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; outputs = inputs.self.outputs; };
    modules = [
      ../hosts/nixos/${hostname}
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit inputs;
            outputs = inputs.self.outputs;
            platform = "linux";
          };
          users.${username} = {
            imports = [
              ../home/platforms/nixos/users/${username}
            ];
          };
        };
      }
    ];
  };

  # Helper function to create Darwin configurations
  mkDarwinConfig = { system, hostname, username ? "w" }: inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit inputs; outputs = inputs.self.outputs; };
    modules = [
      ../hosts/darwin/${hostname}
      inputs.home-manager.darwinModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit inputs;
            outputs = inputs.self.outputs;
            platform = "darwin";
          };
          users.${username} = {
            imports = [
              ../home/platforms/darwin/users/${username}
            ];
          };
        };
      }
    ];
  };
}
