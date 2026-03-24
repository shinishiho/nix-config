{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.myModules.services.zerotierone;
in
{
  options.myModules.services.zerotierone = {
    enable = mkEnableOption "Zerotier One configuration";
  };

  config = mkIf cfg.enable {
    services = {
      zerotierone = {
        enable = true;
      };
    };

    environment.persistence."/persistent".directories = [
      "/var/lib/zerotier-one"
    ];
  };
}
