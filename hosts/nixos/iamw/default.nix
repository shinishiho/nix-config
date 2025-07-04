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
  ];

  # Enable the modules that were previously imported directly
  myModules = {
    shared = {
      fonts.enable = true;
    };

    nixos = {
      desktop = {
        displayManager.enable = true;
        gaming.enable = true;
        gnome.enable = false;
        # hyprland.enable = true;
      };
      hardware = {
        audio.enable = true;
        bluetooth.enable = true;
      };
      services = {
        networking.enable = true;
        ssh.enable = true;
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
  };

  system.stateVersion = lib.mkForce "25.11";
}
