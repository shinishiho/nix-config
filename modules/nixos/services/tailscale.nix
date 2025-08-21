{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.myModules.common.tailscale;
in
{
  config = mkIf cfg.enable {
    networking = {
      nameservers = [ "100.100.100.100" ];
      search = [ "cuscus-typhon.ts.net" ];
    };

    environment.persistence."/persistent".directories = mkIf cfg.enable [
      "/var/lib/tailscale"
    ];
  };
}
