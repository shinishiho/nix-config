{
config,
lib,
pkgs,
...
}:

with lib;

let
  cfg = config.myModules.system.locale;
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
  };
}
