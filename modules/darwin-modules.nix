{
  lib,
  ...
}:

with lib;

{
  imports = [
    ./shared
    ./darwin
  ];

  options.myModules = {
    darwin = {
      system = {
        enable = mkEnableOption "Darwin system defaults";
      };
      wm = {
        enable = mkEnableOption "AeroSpace window manager";
      };
      goodies = {
        enable = mkEnableOption "Additional goodies and packages";
      };
    };

    shared = {
      fonts = {
        enable = mkEnableOption "Shared font configuration";
      };
      gaming = {
        enable = mkEnableOption "Shared gaming configuration";
      };
    };
  };
}
