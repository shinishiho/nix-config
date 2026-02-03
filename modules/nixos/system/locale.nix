{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.myModules.system.locale;
in

{
  options.myModules.system.locale = {
    timeZone = mkOption {
      type = types.str;
      default = "Asia/Ho_Chi_Minh";
      description = "System timezone";
    };

    locale = mkOption {
      type = types.str;
      default = "en_US.UTF-8";
      description = "System locale";
    };

    hardwareClockInLocalTime = mkOption {
      type = types.bool;
      default = true;
      description = "Whether the hardware clock is set to local time (useful for dual-boot with Windows)";
    };
  };

  config = {
    time = {
      timeZone = cfg.timeZone;
      hardwareClockInLocalTime = cfg.hardwareClockInLocalTime;
    };

    i18n = {
      defaultLocale = cfg.locale;
      extraLocaleSettings = {
        LC_ADDRESS = cfg.locale;
        LC_IDENTIFICATION = cfg.locale;
        LC_MEASUREMENT = cfg.locale;
        LC_MONETARY = cfg.locale;
        LC_MESSAGES = cfg.locale;
        LC_NAME = cfg.locale;
        LC_NUMERIC = cfg.locale;
        LC_PAPER = cfg.locale;
        LC_TELEPHONE = cfg.locale;
        LC_TIME = cfg.locale;
      };
    };
  };
}
