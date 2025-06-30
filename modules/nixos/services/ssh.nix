{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.myModules.nixos.services.ssh;
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

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
