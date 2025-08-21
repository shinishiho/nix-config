{
  config,
  lib,
  pkgs,
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

  config.home = mkIf cfg.enable {
    packages = with pkgs; [
      moonlight-qt
      parsec-bin
    ];
  };
}