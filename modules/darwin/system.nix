{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.my-modules.darwin.system;
in
{
  config = mkIf cfg.enable {
    system.defaults = {
      dock = {
        autohide = true;
        show-recents = false;
        launchanim = true;
        orientation = "bottom";
        tilesize = 60;
      };
      
      finder = {
        AppleShowAllExtensions = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 14;
        KeyRepeat = 1;
        # Disable press-and-hold for keys in favor of key repeat
        ApplePressAndHoldEnabled = false;
        NSWindowShouldDragOnGesture = true;
      };
    };
  };
}