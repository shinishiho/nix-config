{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.niri.settings = {
    # Environment Variables
    environment = {
      DISPLAY = ":1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "niri";
    };

    hotkey-overlay = {
      skip-at-startup = true;
    };

    # Debug settings
    debug = {
      honor-xdg-activation-with-invalid-serial = [];
    };
  };
}
