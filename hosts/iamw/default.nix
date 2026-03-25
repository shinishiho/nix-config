{
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.default
    inputs.impermanence.nixosModules.impermanence
    inputs.agenix.nixosModules.default

    ../../modules/common
    ../../modules/nixos

    ./hardware-configuration.nix

    ./disko.nix
    ./filesystems.nix
    ./hardware.nix
    ./networking.nix
    ./nvidia.nix
    ./virt

    ./user.nix
  ];

  myModules = {
    desktop = {
      autoLogin = {
        enable = true;
        user = "w";
        command = "niri";
      };
      gnome.enable = false;
      hyprland.enable = false;
      niri.enable = true;
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
      tailscale.enable = false;
      waydroid.enable = true;
      zerotierone.enable = true;
    };

    system = {
      inputMethod.enable = true;
    };
  };

  system.stateVersion = lib.mkForce "26.05";
}
