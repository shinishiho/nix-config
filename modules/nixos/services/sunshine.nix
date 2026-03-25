{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

with lib;

let
  cfg = config.myModules.services.sunshine;
in

  {
  options.myModules.services.sunshine = {
    enable = mkEnableOption "Sunshine and Moonlight";
  };

  config = mkIf cfg.enable {
    services.sunshine = {
      enable = true;

      capSysAdmin = true;
      openFirewall = true;
    };
  };
}
