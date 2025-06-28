{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.my-modules.nixos.services.ssh;
in
{
  config = mkIf cfg.enable {
    services = {
      openssh = {
        enable = true;
        settings = {
          PermitRootLogin = "no";
          PasswordAuthentication = false;
        };
      };
    };
  };
}
