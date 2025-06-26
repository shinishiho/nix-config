{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:
{
  config = ({
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
