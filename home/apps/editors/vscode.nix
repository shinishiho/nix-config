{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:

with lib;

let
  cfg = config.my-apps.editors.vscode;
in
{
  config = mkIf cfg.enable ({
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;
    };
  } // lib.optionalAttrs (platform == "linux") {
    home.persistence = {
      "/persistent/home/w" = {
        directories = [
          ".config/Code/User"
          ".vscode"
        ];
      };
    };
  });
}
