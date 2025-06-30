# NixOS-specific modules entry point
{
  lib,
  ...
}:

with lib;

{
  imports = [
    ./shared
    ./nixos
  ];

  options.myModules = {
    nixos = {
      desktop = {
        displayManager = {
          enable = mkEnableOption "Display manager configuration";
        };
        gnome = {
          enable = mkEnableOption "GNOME desktop environment";
        };
      };
      hardware = {
        audio = {
          enable = mkEnableOption "Audio configuration with PipeWire";
        };
        bluetooth = {
          enable = mkEnableOption "Bluetooth configuration";
        };
      };
      services = {
        networking = {
          enable = mkEnableOption "Networking configuration";
        };
        ssh = {
          enable = mkEnableOption "SSH configuration";
        };
      };
      system = {
        boot = {
          enable = mkEnableOption "Boot configuration";
        };
        locale = {
          enable = mkEnableOption "Locale configuration";
        };
        nix = {
          enable = mkEnableOption "Nix configuration";
        };
        programs = {
          enable = mkEnableOption "System programs";
        };
        security = {
          enable = mkEnableOption "Security configuration";
        };
      };
    };

    shared = {
      fonts = {
        enable = mkEnableOption "Shared font configuration";
      };
      gaming = {
        enable = mkEnableOption "Shared gaming configuration";
      };
    };
  };
}
