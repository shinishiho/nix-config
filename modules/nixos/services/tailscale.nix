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
    services = {
      tailscale = {
        enable = true;
        extraUpFlags = [ "--accept-dns=false" ];
      };
    };

    environment.persistence."/persistent".directories = [
      "/var/lib/tailscale"
    ];
  };
}
