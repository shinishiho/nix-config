{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.myModules.nixos.system.programs;
in
{
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
