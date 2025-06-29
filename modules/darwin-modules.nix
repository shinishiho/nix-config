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

  options.my-modules = {
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
    };
  };
}
