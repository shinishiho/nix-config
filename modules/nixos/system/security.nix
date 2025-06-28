{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.my-modules.nixos.system.security;
in
{
  config = mkIf cfg.enable {
    security.sudo = {
      execWheelOnly = true;
      wheelNeedsPassword = false;
      extraConfig = "Defaults pwfeedback";
    };
  };
}
