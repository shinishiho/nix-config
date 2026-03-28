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
          PasswordAuthentication = true;
        };
      };
    };

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = false;
    };

    environment.persistence."/persistent".files = [
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
    ];
  };
}
