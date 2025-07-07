{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.system.locale;
  fcitx5Cfg = config.myModules.system.locale.fcitx5;
in
{
  options.myModules.system.locale = {
    enable = mkEnableOption "Locale configuration";
    fcitx5 = {
      enable = mkEnableOption "Fcitx5 input method configuration";
    };
  };

  config = mkIf cfg.enable {
    time.timeZone = "Asia/Ho_Chi_Minh";
    time.hardwareClockInLocalTime = true;

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_MESSAGES = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    i18n.inputMethod = mkIf fcitx5Cfg.enable {
      type = "fcitx5";
      enable = true;
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-bamboo
          # fcitx5-mozc
          fcitx5-gtk
        ];

        settings = {
          inputMethod = {
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              DefaultIM = "bamboo";
            };
            "Groups/0/Items/0" = {
              Name = "keyboard-us";
              Layout = "";
            };
            "Groups/0/Items/1" = {
              Name = "bamboo";
              Layout = "";
            };
            # "Groups/0/Items/2" = {
            #   Name = "mozc";
            #   Layout = "";
            # };
            "GroupOrder" = {
              "0" = "Default";
            };
          };
        };
      };
    };
  };
}
