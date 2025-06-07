{
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.default
    inputs.impermanence.nixosModules.impermanence
    inputs.home-manager.nixosModules.home-manager

    ../../../modules/nixos/audio.nix
    ../../../modules/nixos/boot.nix
    ../../../modules/nixos/gnome.nix
    ../../../modules/nixos/networking.nix
    ../../../modules/nixos/nixpkgs.nix
    ../../../modules/nixos/system.nix
    ../../../modules/nixos/systemapps.nix
    ../../../modules/nixos/timelangloc.nix

    ./hardware-configuration.nix
    ./disko.nix
    ./filesystems.nix
    ./misc.nix
    ./networking.nix
    ./user.nix
  ];

  system.stateVersion = "25.11";
}
