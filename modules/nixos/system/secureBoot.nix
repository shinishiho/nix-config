{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.system.secureBoot;
in

{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  options.myModules.system.secureBoot = {
    enable = mkEnableOption "Enable Secure Boot";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.sbctl
    ];

    boot = {
      loader.systemd-boot.enable = mkForce false;
      lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      };
    };

    environment.persistence."/persistent".directories = [
      "/var/lib/sbctl"
    ];
  };
}
