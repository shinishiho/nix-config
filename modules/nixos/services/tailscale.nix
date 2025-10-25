{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.myModules.services.tailscale;
in
{
  options.myModules.services.tailscale = {
    enable = mkEnableOption "Tailscale configuration";
  };

  config = mkIf cfg.enable {
    services.tailscale = {
      enable = true;
    };

    networking = {
      nameservers = [ "100.100.100.100" ];
      search = [ "cuscus-typhon.ts.net" ];
    };

    environment.persistence."/persistent".directories = [
      "/var/lib/tailscale"
    ];
  };
}
