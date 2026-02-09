{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.niri.settings = {
    # Output configuration
    outputs = {
      "HDMI-A-1" = {
        scale = 1.0;
      };
      "HDMI-A-2" = {
        mode = {
          width = 2560;
          height = 1600;
          refresh = 129.994;
        };
        scale = 1.0;
      };
    };
  };
}
