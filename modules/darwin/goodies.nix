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
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      raycast
    ];
  };
}
