{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.myModules.common.tailscale;
in
{
  options.myModules.common.tailscale = {
    enable = mkEnableOption "Tailscale configuration";
  };

  config.services.tailscale.enable = cfg.enable;
}
