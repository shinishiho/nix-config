{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.my-apps.browsers.chromium;
in
{
  options.my-apps.browsers.chromium = {
    enable = mkEnableOption "Ungoogled Chromium";
  };

  config = mkIf cfg.enable {
    programs.chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
    };
  };
}
