{
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.default
    inputs.impermanence.nixosModules.impermanence

    ../../modules/common
    ../../modules/nixos

    ./hardware-configuration.nix

    ./disko.nix
    ./filesystems.nix
    ./gaming.nix
    ./hardware.nix
    ./inputMethod.nix
    ./networking.nix

    ./users/w
  ];

  myModules = {
    desktop = {
      gnome.enable = false;
      hyprland.enable = true;
    };

    hardware = {
      audio.enable = true;
      bluetooth.enable = true;
    };

    services = {
      docker.enable = true;
      keyd.enable = true;
      networking.enable = true;
      ssh.enable = true;
      tailscale.enable = true;
      waydroid.enable = false;
    };
  };

  system.stateVersion = lib.mkForce "26.05";
}
