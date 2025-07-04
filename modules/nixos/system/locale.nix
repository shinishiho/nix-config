{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.nixos.system.locale;
  fcitx5Cfg = config.myModules.nixos.system.locale.fcitx5;
in
{
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
      fcitx5.addons = with pkgs; [
        fcitx5-bamboo
        fcitx5-mozc
        fcitx5-gtk
      ];
    };
  };
}
