{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.myModules.services.ssh;
in
{
  options.myModules.services.ssh = {
    enable = mkEnableOption "SSH configuration";
  };

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
