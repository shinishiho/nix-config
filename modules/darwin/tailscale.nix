{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.services.tailscale;
in
{
  options.myModules.services.tailscale = {
    enable = mkEnableOption "Tailscale for Darwin";
  };

  config = mkIf cfg.enable {
    services.tailscale = {
      enable = true;
    };
  };
}
