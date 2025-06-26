{ config, lib, pkgs, platform ? "linux", ... }:

with lib;

let
  cfg = config.my-apps.gaming.parsec;
in
{
  config = mkIf cfg.enable ({
    home.packages = with pkgs; [
      parsec-bin
    ];
  } // lib.optionalAttrs (platform == "linux") {
    home.persistence = {
      "/persistent/home/w" = {
        directories = [
          ".parsec"
        ];
      };
    };
  });
}
