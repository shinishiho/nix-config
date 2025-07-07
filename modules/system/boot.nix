{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.system.boot;
in
{
  options.myModules.system.boot = {
    enable = mkEnableOption "Boot configuration";
  };

  config = mkIf cfg.enable {
    boot = {
      loader = {
        systemd-boot.enable = true;
        systemd-boot.consoleMode = "max";
        efi.canTouchEfiVariables = true;
      };

      initrd.systemd.enable = true;
      # kernelPackages = pkgs.linuxPackages_cachyos.cachyOverride { mArch = "GENERIC_V3"; };
      kernelPackages = pkgs.linuxPackages_cachyos;

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
