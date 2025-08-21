{
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.default
    inputs.impermanence.nixosModules.impermanence

    ../../../modules/common
    ../../../modules/nixos

    ./hardware-configuration.nix

    ./disko.nix
    ./filesystems.nix
    ./hardware.nix
    ./inputMethod.nix
    ./networking.nix

    ./users/w
  ];

  myModules = {
    common = {
      fonts.enable = true;
      tailscale.enable = true;
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
      networking.enable = true;
      ssh.enable = true;
      waydroid.enable = false;
    };
    system = {
      boot.enable = true;
      locale.enable = true;
      nix.enable = true;
      programs.enable = true;
      security.enable = true;
    };
  };

  system.stateVersion = lib.mkForce "25.11";
}
