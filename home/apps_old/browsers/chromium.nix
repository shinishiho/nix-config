{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:
{
  config = ({
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
