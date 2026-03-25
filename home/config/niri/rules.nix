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
          { app-id = "MateEngineX.x86_64$"; }
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
        matches = [
          { app-id = "^mpv$"; }
        ];
        open-fullscreen = true;
      }

      {
        matches = [
          { app-id = "^Waydroid$"; }
        ];
        open-fullscreen = true;
      }

      {
        matches = [
          { app-id = "^one.alynx.showmethekey$"; }
        ];
        open-floating = true;
        open-focused = false;
        draw-border-with-background = false;
        shadow = {
          enable = false;
        };
        focus-ring = {
          enable = false;
        };
        geometry-corner-radius = {
          bottom-left = 0.0;
          bottom-right = 0.0;
          top-left = 0.0;
          top-right = 0.0;
        };
        clip-to-geometry = true;
        min-width = 330;
        max-width = 330;
        min-height = 35;
        max-height = 35;
        default-floating-position = {
          x = 32;
          y = 32;
          relative-to = "bottom-right";
        };
        opacity = 0.8;
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
          { namespace = "^quickshell$"; }
        ];
        place-within-backdrop = true;
      }
      {
        matches = [
          { namespace = "^dms:blurwallpaper$"; }
        ];
        place-within-backdrop = true;
      }
    ];
  };
}
