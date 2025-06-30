{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.myModules.nixos.hardware.bluetooth;
in
{
  config = mkIf cfg.enable {
    services.blueman.enable = true;

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };
  };
}
