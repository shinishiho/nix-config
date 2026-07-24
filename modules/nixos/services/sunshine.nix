{
  config,
  lib,
  pkgs,
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
      package = pkgs.sunshine.override {
        cudaSupport = true;
      };

      capSysAdmin = true;
      openFirewall = true;
    };

    environment.persistence."/persistent".users.w.directories = [
      ".config/sunshine"
    ];
  };
}
