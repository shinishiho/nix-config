{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:

with lib;

let
  cfg = config.my-apps.gaming.parsec;
in
{
  config.home = mkIf cfg.enable ({
    packages = with pkgs; [
      parsec-bin
    ];
  } // lib.optionalAttrs (platform == "linux") {
    persistence = {
      "/persistent/home/w" = {
        directories = [
          ".parsec"
        ];
      };
    };
  });
}
