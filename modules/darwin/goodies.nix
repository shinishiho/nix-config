{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.my-modules.darwin.goodies;
in
{
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      raycast
    ];
  };
}
