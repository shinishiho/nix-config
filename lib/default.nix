{
  inputs,
  lib,
  nixpkgs,
}:

{
  mkNixosConfig = { system, hostname, username ? "w" }: nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; inherit (inputs.self) outputs; };
    modules = [
      ../hosts/nixos/${hostname}
      inputs.home-manager.nixosModules.home-manager
      inputs.chaotic.nixosModules.default
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

  mkDarwinConfig = { system, hostname, username ? "w" }: inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit inputs; inherit (inputs.self) outputs; };
    modules = [
      # https://github.com/nix-darwin/nix-darwin/pull/1396
      { disabledModules = [ "system/applications.nix" ]; }
      "${inputs.nix-darwin-linking}/modules/system/applications.nix"

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
