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

  options.my-modules = {
    nixos = {
      desktop = {
        gnome = {
          enable = mkEnableOption "GNOME desktop environment";
        };
      };
      hardware = {
        enable = mkEnableOption "Hardware configuration";
        audio = {
          enable = mkEnableOption "Audio configuration with PipeWire";
        };
      };
      services = {
        enable = mkEnableOption "System services";
        networking = {
          enable = mkEnableOption "Networking configuration";
        };
        ssh = {
          enable = mkEnableOption "SSH configuration";
        };
      };
      system = {
        enable = mkEnableOption "NixOS system configuration";
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
    };
  };
}
