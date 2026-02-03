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
    # ./gaming.nix
    ./hardware.nix
    # ./inputMethod.nix
    ./networking.nix
    ./nvidia.nix
    ./virt

    ./users/w
  ];

  myModules = {
    desktop = {
      autoLogin.enable = true;
      gnome.enable = false;
      hyprland.enable = true;
    };

    hardware = {
      audio.enable = true;
      bluetooth.enable = true;
    };

    services = {
      docker.enable = false;
      gaming.enable = true;
      keyd.enable = true;
      networking.enable = true;
      ssh.enable = true;
      tailscale.enable = true;
      waydroid.enable = true;
    };

    system = {
      inputMethod.enable = true;
    };
  };

  system.stateVersion = lib.mkForce "26.05";
}
