{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.myModules.system.programs;
in
{
  options.myModules.system.programs = {
    enable = mkEnableOption "System programs";
  };

  config = mkIf cfg.enable {
    programs = {
      weylus = {
        enable = true;
        users = [ "w" ];
        openFirewall = true;
      };

      appimage = {
        enable = true;
        binfmt = true;
      };

      adb.enable = true;
      fuse.userAllowOther = true;
    };
  };
}
