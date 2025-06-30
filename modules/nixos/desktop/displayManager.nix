{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.nixos.desktop.displayManager;
in
{
  config = mkIf cfg.enable {
    services = {
      displayManager = {
        # autoLogin.enable = true;
        # autoLogin.user = "w";

        sddm = {
          enable = false;
          package = pkgs.kdePackages.sddm;
          wayland = {
            enable = true;
          };

          extraPackages = with pkgs; [
            sddm-astronaut
          ];
        };

        gdm = {
          enable = true;
        };
      };
    };
  };
}
