{
  inputs,
  lib,
  nixpkgs,
}:

{
  mkNixosConfig = { system, hostname }: nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; inherit (inputs.self) outputs; };
    modules = [
      ../hosts/${system}/${hostname}
      inputs.home-manager.nixosModules.home-manager
      inputs.chaotic.nixosModules.default
    ];
  };

  mkDarwinConfig = { system, hostname }: inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit inputs; inherit (inputs.self) outputs; };
    modules = [
      ../hosts/${system}/${hostname}
      inputs.home-manager.darwinModules.home-manager
    ];
  };
}
