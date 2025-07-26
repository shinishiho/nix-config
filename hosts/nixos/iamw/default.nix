{
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.default
    inputs.impermanence.nixosModules.impermanence

    ../../../modules/nixos-modules.nix  # Import NixOS-specific modules

    ./hardware-configuration.nix
    ./disko.nix
    ./filesystems.nix
    ./misc.nix
    ./networking.nix
    ./user.nix
    ./fan.nix
  ];

  myModules = {
    shared = {
      fonts.enable = true;
    };

    desktop = {
      displayManager.enable = true;
      gaming.enable = true;
      gnome.enable = false;
      hyprland.enable = true;
    };
    hardware = {
      audio.enable = true;
      bluetooth.enable = true;
    };
    services = {
      keyd.enable = true;
      networking = {
        enable = true;
        tailscale.enable = true;
      };
      ssh.enable = true;
      waydroid.enable = false;
    };
    system = {
      boot.enable = true;
      locale = {
        enable = true;
        fcitx5.enable = true;
      };
      nix.enable = true;
      programs.enable = true;
      security.enable = true;
    };
  };

  system.stateVersion = lib.mkForce "25.11";
}
