{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.my-apps.editors.cursor;
in
{
  options.my-apps.editors.cursor = {
    enable = mkEnableOption "Cursor Editor";
  };

  config.home = mkIf cfg.enable {
    packages = with pkgs; [
      code-cursor
    ];
  };
}