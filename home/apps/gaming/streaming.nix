{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:

with lib;

let
  cfg = config.my-apps.gaming.streaming;
in
{
  options.my-apps.gaming.streaming = {
    enable = mkEnableOption "Game Streaming";
  };

  config.home = mkIf cfg.enable ({
    packages = with pkgs; [
      moonlight-qt
      parsec-bin
    ];
  } // lib.optionalAttrs (platform == "linux") {
    persistence = {
      "/persistent/home/w" = {
        directories = [
          ".config/Moonlight Game Streaming Project"
          ".parsec"
        ];
      };
    };
  });
}