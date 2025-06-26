{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:
{
  config = ({
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
    home.persistence."/persistent/home/w" = {
      directories = [
        ".thunderbird"
      ];
    };
  });
} 