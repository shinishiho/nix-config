{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.my-modules.nixos.system.programs;
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
      fish.enable = true;
      steam.enable = true;
      fuse.userAllowOther = true;
    };
  };
}
