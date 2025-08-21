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
      # https://github.com/nix-darwin/nix-darwin/pull/1396
      { disabledModules = [ "system/applications.nix" ]; }
      "${inputs.nix-darwin-linking}/modules/system/applications.nix"

      ../hosts/${system}/${hostname}
      inputs.home-manager.darwinModules.home-manager
    ];
  };
}
