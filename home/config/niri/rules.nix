{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.niri.settings = {
    # Window Rules
    window-rules = [
      {
        matches = [
          {
            app-id = "^zen$";
            title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
        default-floating-position = {
          x = 32;
          y = 32;
          relative-to = "bottom-left";
        };
      }
      
      {
        matches = [
          { app-id = "^kitty$"; }
        ];
        draw-border-with-background = false;
      }
      
      {
        matches = [
          { app-id = "^MateEngineX\\.x86_64$"; }
        ];
        open-floating = true;
        draw-border-with-background = false;
        shadow = {
          enable = false;
        };
        clip-to-geometry = true;
        default-floating-position = {
          x = 32;
          y = 32;
          relative-to = "bottom-right";
        };
      }
      
      {
        geometry-corner-radius = {
          bottom-left = 20.0;
          bottom-right = 20.0;
          top-left = 20.0;
          top-right = 20.0;
        };
        clip-to-geometry = true;
      }
      
      {
        matches = [
          { is-active = false; }
        ];
        opacity = 0.95;
      }
    ];

    # Layer Rules
    layer-rules = [
      {
        matches = [
          { namespace = "^noctalia-wallpaper"; }
        ];
        place-within-backdrop = true;
      }
    ];
  };
}
