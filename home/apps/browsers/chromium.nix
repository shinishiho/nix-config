{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:

with lib;

let
  cfg = config.my-apps.browsers.chromium;
in
{
  config = mkIf cfg.enable ({
    programs.chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
    };
  } // lib.optionalAttrs (platform == "linux") {
    home.persistence = {
      "/persistent/home/w" = {
        directories = [
          ".config/chromium"
        ];
      };
    };
  });
}
