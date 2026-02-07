{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    
    settings = {
      # Input configuration
      input = {
        keyboard = {
          xkb = {
            layout = "us";
          };
          numlock = true;
        };
        
        touchpad = {
          tap = true;
          natural-scroll = true;
        };
        
        focus-follows-mouse = {
          max-scroll-amount = "25%";
        };
      };

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

      # Keybindings
      binds = {
        "Mod+Shift+Escape".action.show-hotkey-overlay = {};
        
        # Applications
        "Mod+Return" = {
          action.spawn = [ "kitty" ];
          hotkey-overlay.title = "Open Terminal: kitty";
        };
        "Mod+Space" = {
          action.spawn = [ "sh" "-c" "qs -c noctalia-shell ipc call launcher toggle" ];
          hotkey-overlay.title = "Open App Launcher: wofi";
        };
        "Mod+B" = {
          action.spawn = [ "zen-browser" ];
          hotkey-overlay.title = "Open Browser: firefox";
        };
        "Mod+Alt+L" = {
          action.spawn = [ "sh" "-c" "qs -c noctalia-shell ipc call sessionMenu lockAndSuspend" ];
          hotkey-overlay.title = "Lock and Sleep";
        };
        "Mod+E" = {
          action.spawn = [ "nautilus" ];
          hotkey-overlay.title = "File Manager: Nautilus";
        };

        # Audio Controls
        "XF86AudioRaiseVolume" = {
          action.spawn = [ "sh" "-c" "qs -c noctalia-shell ipc call volume increase" ];
          allow-when-locked = true;
        };
        "XF86AudioLowerVolume" = {
          action.spawn = [ "sh" "-c" "qs -c noctalia-shell ipc call volume decrease" ];
          allow-when-locked = true;
        };
        "XF86AudioMute" = {
          action.spawn = [ "sh" "-c" "qs -c noctalia-shell ipc call volume muteOutput" ];
          allow-when-locked = true;
        };
        "XF86AudioMicMute" = {
          action.spawn = [ "sh" "-c" "qs -c noctalia-shell ipc call volume muteInput" ];
          allow-when-locked = true;
        };
        "XF86AudioNext" = {
          action.spawn = [ "sh" "-c" "qs -c noctalia-shell ipc call media next" ];
          allow-when-locked = true;
        };
        "XF86AudioPause" = {
          action.spawn = [ "sh" "-c" "qs -c noctalia-shell ipc call media playPause" ];
          allow-when-locked = true;
        };
        "XF86AudioPlay" = {
          action.spawn = [ "sh" "-c" "qs -c noctalia-shell ipc call media playPause" ];
          allow-when-locked = true;
        };
        "XF86AudioPrev" = {
          action.spawn = [ "sh" "-c" "qs -c noctalia-shell ipc call media previous" ];
          allow-when-locked = true;
        };

        "XF86MonBrightnessUp" = {
          action.spawn = [ "sh" "-c" "qs -c noctalia-shell ipc call brightness increase" ];
          allow-when-locked = true;
        };
        "XF86MonBrightnessDown" = {
          action.spawn = [ "sh" "-c" "qs -c noctalia-shell ipc call brightness decrease" ];
          allow-when-locked = true;
        };

        # Window Management
        "Mod+Q".action.close-window = {};
        
        "Mod+Left".action.focus-column-left = {};
        "Mod+H".action.focus-column-left = {};
        "Mod+Right".action.focus-column-right = {};
        "Mod+L".action.focus-column-right = {};
        "Mod+Up".action.focus-window-up = {};
        "Mod+K".action.focus-window-up = {};
        "Mod+Down".action.focus-window-down = {};
        "Mod+J".action.focus-window-down = {};

        "Mod+Ctrl+Left".action.move-column-left = {};
        "Mod+Ctrl+H".action.move-column-left = {};
        "Mod+Ctrl+Right".action.move-column-right = {};
        "Mod+Ctrl+L".action.move-column-right = {};
        "Mod+Ctrl+Up".action.move-window-up = {};
        "Mod+Ctrl+K".action.move-window-up = {};
        "Mod+Ctrl+Down".action.move-window-down = {};
        "Mod+Ctrl+J".action.move-window-down = {};

        "Mod+Comma".action.consume-or-expel-window-left = {};
        "Mod+Period".action.consume-or-expel-window-right = {};

        "Mod+Home".action.focus-column-first = {};
        "Mod+End".action.focus-column-last = {};
        "Mod+Ctrl+Home".action.move-column-to-first = {};
        "Mod+Ctrl+End".action.move-column-to-last = {};

        "Mod+Shift+Left".action.focus-monitor-left = {};
        "Mod+Shift+Right".action.focus-monitor-right = {};
        "Mod+Shift+Up".action.focus-monitor-up = {};
        "Mod+Shift+Down".action.focus-monitor-down = {};

        "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = {};
        "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = {};
        "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = {};
        "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = {};

        # Workspace Switching
        "Mod+WheelScrollDown" = {
          action.focus-workspace-down = {};
          cooldown-ms = 150;
        };
        "Mod+WheelScrollUp" = {
          action.focus-workspace-up = {};
          cooldown-ms = 150;
        };
        "Mod+Ctrl+WheelScrollDown" = {
          action.move-column-to-workspace-down = {};
          cooldown-ms = 150;
        };
        "Mod+Ctrl+WheelScrollUp" = {
          action.move-column-to-workspace-up = {};
          cooldown-ms = 150;
        };

        "Mod+WheelScrollRight".action.focus-column-right = {};
        "Mod+WheelScrollLeft".action.focus-column-left = {};
        "Mod+Ctrl+WheelScrollRight".action.move-column-right = {};
        "Mod+Ctrl+WheelScrollLeft".action.move-column-left = {};

        "Mod+Shift+WheelScrollDown".action.focus-column-right = {};
        "Mod+Shift+WheelScrollUp".action.focus-column-left = {};
        "Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = {};
        "Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = {};

        # Workspace numbers
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;

        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;
        "Mod+Shift+6".action.move-column-to-workspace = 6;
        "Mod+Shift+7".action.move-column-to-workspace = 7;
        "Mod+Shift+8".action.move-column-to-workspace = 8;
        "Mod+Shift+9".action.move-column-to-workspace = 9;

        "Mod+Tab".action.focus-workspace-previous = {};

        # Layout Controls
        "Mod+F".action.expand-column-to-available-width = {};
        "Mod+C".action.center-column = {};
        "Mod+Ctrl+C".action.center-visible-columns = {};
        "Mod+Minus".action.set-column-width = "-10%";
        "Mod+Equal".action.set-column-width = "+10%";
        "Mod+Shift+Minus".action.set-window-height = "-10%";
        "Mod+Shift+Equal".action.set-window-height = "+10%";

        # Modes
        "Mod+T".action.toggle-window-floating = {};
        "Mod+Shift+F".action.fullscreen-window = {};
        "Mod+W".action.toggle-column-tabbed-display = {};
        "Mod+R".action.switch-preset-column-width = {};

        # Screenshots
        "Print".action.screenshot = {};
        "Ctrl+Shift+2".action.screenshot-screen = {};
        "Ctrl+Shift+3".action.screenshot-window = {};

        # Emergency Escape Key
        "Mod+Escape" = {
          action.toggle-keyboard-shortcuts-inhibit = {};
          allow-inhibiting = false;
        };

        # Exit / Power
        "Ctrl+Alt+Delete" = {
          action.spawn = [ "sh" "-c" "qs -c noctalia-shell ipc call sessionMenu toggle" ];
          hotkey-overlay.title = "Power Menu";
        };
        "Mod+Shift+P".action.power-off-monitors = {};
        "Mod+O" = {
          action.toggle-overview = {};
          repeat = false;
        };

        "Mod+Shift+W" = {
          action.spawn = [ "sh" "-c" "qs -c noctalia-shell ipc call wallpaper toggle" ];
          hotkey-overlay.title = "Change wallpaper";
        };
      };

      # Startup applications
      spawn-at-startup = [
        { command = [ "/usr/lib/polkit-kde-authentication-agent-1" ]; }
      ];

      prefer-no-csd = true;
      screenshot-path = null;

      # Layout Settings
      layout = {
        gaps = 8;
        center-focused-column = "never";
        
        preset-column-widths = [
          { proportion = 0.98; }
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];

        focus-ring = {
          width = 3;
          active.color = "#00ac89";
          inactive.color = "#505050";
        };

        shadow = {
          softness = 30.0;
          spread = 5.0;
          offset = {
            x = 0;
            y = 5;
          };
          color = "#0007";
        };

        struts = {};
        background-color = "transparent";
      };

      # Animation Settings
      animations = {
        enable = false;
        
        workspace-switch = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 1000;
            epsilon = 0.0001;
          };
        };
        
        window-open = {
          duration-ms = 200;
          curve = "ease-out-quad";
        };
        
        window-close = {
          duration-ms = 200;
          curve = "ease-out-cubic";
        };
        
        horizontal-view-movement = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 900;
            epsilon = 0.0001;
          };
        };
        
        window-movement = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };
        
        window-resize = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 1000;
            epsilon = 0.0001;
          };
        };
        
        config-notification-open-close = {
          spring = {
            damping-ratio = 0.6;
            stiffness = 1200;
            epsilon = 0.001;
          };
        };
        
        screenshot-ui-open = {
          duration-ms = 300;
          curve = "ease-out-quad";
        };
        
        overview-open-close = {
          spring = {
            damping-ratio = 1.0;
            stiffness = 900;
            epsilon = 0.0001;
          };
        };
      };

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

      include = "./noctalia.kdl";
    };
  };
}
