{
  config,
  lib,
  platform ? "linux",
  ...
}:

with lib;

let
  cfg = config.my-apps.communication.thunderbird;
in
{
  options.my-apps.communication.thunderbird = {
    enable = mkEnableOption "Thunderbird";
  };

  config = mkIf cfg.enable ({
    programs.thunderbird = {
      enable = true;

      profiles = {
        "default" = {
          isDefault = true;
          name = "W";
        };
      };
    };
  } // lib.optionalAttrs (platform == "linux") {
    home.persistence."/persistent/home/w".directories = [
      ".thunderbird"
    ];
  });
}