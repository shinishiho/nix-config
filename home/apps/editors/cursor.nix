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
  config.home = mkIf cfg.enable ({
    packages = with pkgs; [
      code-cursor
    ];
  } // lib.optionalAttrs (platform == "linux") {
    persistence."/persistent/home/w".directories = [
      ".cursor"
      ".config/Cursor"
    ];
  });
}
