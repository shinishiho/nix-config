{ config, lib, pkgs, platform ? "linux", ... }:

let
  inherit (lib) mkEnableOption mkIf optionalAttrs;
in
{
  options.thunderbird = {
    enable = mkEnableOption "Thunderbird configuration";
  };

  config = mkIf config.thunderbird.enable ({
    programs.thunderbird = {
      enable = true;

      profiles = {
        "default" = {
          isDefault = true;
          name = "W";
        };
      };
    };
  } // optionalAttrs (platform == "linux") {
    home.persistence."/persistent/home/w" = {
      directories = [
        ".thunderbird"
      ];
    };
  });
} 