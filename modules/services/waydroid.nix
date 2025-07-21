{
  config,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.myModules.services.waydroid;
in
{
  options.myModules.services.waydroid = {
    enable = mkEnableOption "Enable waydroid";
  };

  config = mkIf cfg.enable {
    virtualisation.waydroid.enable = true;

    environment.persistence."/persistent".directories = [
      "/var/lib/waydroid"
    ];

    environment.persistence."/persistent".users.w.directories = [
      ".local/share/waydroid"
    ];
  };
}
