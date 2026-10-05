{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.services.waydroid;
in
{
  options.myModules.services.waydroid = {
    enable = mkEnableOption "Enable waydroid";
  };

  config = mkIf cfg.enable {
    virtualisation.waydroid = {
      enable = true;
    };

    environment = {
      systemPackages = with pkgs; [
        waydroid-helper
      ];

      persistence."/persistent".directories = [
        "/var/lib/waydroid"
      ];

      persistence."/persistent".users.w.directories = [
        ".local/share/waydroid"
      ];
    };
  };
}
