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
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      raycast
    ];
  };
}
