{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.darwin.goodies;
in
{
  options.myModules.darwin.goodies = {
    enable = mkEnableOption "Additional goodies and packages";
    tailscale.enable = mkEnableOption "Tailscale network";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      raycast
    ];

    services.tailscale.enable = cfg.tailscale.enable;
  };
}
