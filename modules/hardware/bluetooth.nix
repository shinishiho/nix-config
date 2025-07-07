{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.myModules.hardware.bluetooth;
in
{
  options.myModules.hardware.bluetooth = {
    enable = mkEnableOption "Bluetooth configuration";
  };

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
