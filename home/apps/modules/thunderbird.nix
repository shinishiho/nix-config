{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.thunderbird = {
    enable = mkEnableOption "Thunderbird configuration";
  };

  config = mkIf config.thunderbird.enable {
    programs.thunderbird = {
      enable = true;

      profiles = {
        "default" = {
          isDefault = true;
          name = "W";
        };
      };
    };

    home.persistence."/persistent/home/w" = {
      directories = [
        ".thunderbird"
      ];
    };
  };
} 