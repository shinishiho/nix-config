{
config,
lib,
pkgs,
...
}:

with lib;

let
  cfg = config.myModules.desktop.displayManager;
in
  {
  options.myModules.desktop.displayManager = {
    enable = mkEnableOption "Display manager configuration";
  };

  config = mkIf cfg.enable {
    services = {
      displayManager = {
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
      };
    };
  };
}
