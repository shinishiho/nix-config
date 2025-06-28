{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:

with lib;

let
  cfg = config.my-apps.editors.cursor;
in
{
  config = mkIf cfg.enable ({
    home.packages = with pkgs; [
      code-cursor
    ];
  } // lib.optionalAttrs (platform == "linux") {
    home.persistence."/persistent/home/w" = {
      directories = [
        ".cursor"
        ".config/Cursor"
      ];
    };
  });
}
