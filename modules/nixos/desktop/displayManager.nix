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
          enable = true;
          package = pkgs.kdePackages.sddm;
          wayland = {
            enable = true;
          };

          theme = "${
            (
              pkgs.sddm-astronaut.override {
                embeddedTheme = "pixel_sakura";
              }
            )
          }/share/sddm/themes/sddm-astronaut-theme";

          extraPackages = with pkgs; [
            (
              sddm-astronaut.override {
                embeddedTheme = "pixel_sakura";
              }
            )
          ];
        };

        gdm = {
          enable = false;
        };
      };
    };
  };
}
