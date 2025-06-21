{
  inputs,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.default
    inputs.impermanence.nixosModules.impermanence

    ../../../modules/shared/fonts.nix

    ../../../modules/nixos/desktop
    ../../../modules/nixos/hardware
    ../../../modules/nixos/services
    ../../../modules/nixos/system

    ./hardware-configuration.nix
    ./disko.nix
    ./filesystems.nix
    ./misc.nix
    ./networking.nix
    ./user.nix
  ];

  system.stateVersion = "25.11";
}
