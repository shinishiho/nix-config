{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.myModules.services.docker;
in
{
  options.myModules.services.docker = {
    enable = mkEnableOption "Enable docker";
  };

  config = mkIf cfg.enable {
    virtualisation.docker.enable = true;

    environment.persistence."/persistent".directories = [
      "/var/lib/docker"
    ];
  };
}
