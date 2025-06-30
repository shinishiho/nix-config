{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.nixos.system.boot;
in
{
  config = mkIf cfg.enable {
    boot = {
      loader = {
        systemd-boot.enable = true;
        systemd-boot.consoleMode = "max";
        efi.canTouchEfiVariables = true;
      };

      initrd.systemd.enable = true;
      kernelPackages = pkgs.linuxPackages_zen;

      consoleLogLevel = 0;
      kernelParams = [
        "quiet"
        "udev.log_level=0"
      ];

      plymouth = {
        enable = true;
        theme = "circuit";
        themePackages = with pkgs; [
          (adi1090x-plymouth-themes.override {
            selected_themes = [ "circuit" ];
          })
        ];
      };
    };
  };
}
