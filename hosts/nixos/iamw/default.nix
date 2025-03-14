{
  inputs,
  lib,
  config,
  device ? throw "Set this to your disk device, e.g. /dev/sda",
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.default
    inputs.impermanence.nixosModules.impermanence
    inputs.home-manager.nixosModules.home-manager

    # Use the default.nix from modules which imports all NixOS modules
    ../../../modules/nixos
    ../../../modules/shared

    # Host-specific configurations
    ./host-specific.nix
    ./hardware-configuration.nix
    (import ./disko.nix { inherit device; })
  ];
}
