{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.my-modules.darwin.wm;
in
{
  config = mkIf cfg.enable {
    services.aerospace = {
      enable = true;
      settings = {
        # Commands to run after login (managed by launchd)
        after-login-command = [];

        # Commands to run after AeroSpace startup
        after-startup-command = [
          "exec-and-forget ${pkgs.autoraise}/bin/autoraise"
        ];

        # Start AeroSpace at login (managed by launchd)
        start-at-login = false;

        # Normalization settings
        enable-normalization-flatten-containers = true;
        enable-normalization-opposite-orientation-for-nested-containers = true;

        # Layout configuration
        accordion-padding = 30;
        default-root-container-layout = "tiles";
        default-root-container-orientation = "auto";

        # Mouse follows focus when focused monitor changes
        on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];

        # Key mapping preset
        key-mapping.preset = "qwerty";

        # Gaps configuration
        gaps = {
          inner = {
            horizontal = 5;
            vertical = 5;
          };
          outer = {
            left = 0;
            bottom = 0;
            top = 0;
            right = 0;
          };
        };

        # Main binding mode
        mode.main.binding = {
          # Layout commands
          "alt-slash" = "layout tiles horizontal vertical";
          "alt-comma" = "layout accordion horizontal vertical";

          # Focus commands
          "alt-h" = "focus left";
          "alt-j" = "focus down";
          "alt-k" = "focus up";
          "alt-l" = "focus right";

          # Move commands
          "alt-shift-h" = "move left";
          "alt-shift-j" = "move down";
          "alt-shift-k" = "move up";
          "alt-shift-l" = "move right";

          # Resize commands
          "alt-equal" = "resize smart +50";

          # Workspace navigation
          "alt-1" = "workspace 1";
          "alt-2" = "workspace 2";
          "alt-3" = "workspace 3";
          "alt-4" = "workspace 4";
          "alt-5" = "workspace 5";
          "alt-6" = "workspace 6";
          "alt-7" = "workspace 7";
          "alt-8" = "workspace 8";
          "alt-9" = "workspace 9";

          # Move node to workspace
          "alt-shift-1" = "move-node-to-workspace 1";
          "alt-shift-2" = "move-node-to-workspace 2";
          "alt-shift-3" = "move-node-to-workspace 3";
          "alt-shift-4" = "move-node-to-workspace 4";
          "alt-shift-5" = "move-node-to-workspace 5";
          "alt-shift-6" = "move-node-to-workspace 6";
          "alt-shift-7" = "move-node-to-workspace 7";
          "alt-shift-8" = "move-node-to-workspace 8";
          "alt-shift-9" = "move-node-to-workspace 9";

          # Workspace back and forth
          "alt-tab" = "workspace-back-and-forth";
          "alt-shift-tab" = "move-workspace-to-monitor --wrap-around next";

          # Launching applications
            "alt-enter" = "exec-and-forget ${pkgs.kitty}/bin/kitty --directory=$HOME";
        };

        on-window-detected = [
          {
            "if" = {
              app-id = "com.apple.Safari";
              window-title-regex-substring = "W";
            };
            run = [
              "move-node-to-workspace 1" # Main profile
            ];
          }
          {
            "if" = {
              app-id = "com.apple.Safari";
              window-title-regex-substring = "VGU";
            };
            run = [
              "move-node-to-workspace 2" # School profile
            ];
          }
          {
            "if" = {
              app-id = "com.microsoft.VSCode";
            };
            run = [
              "move-node-to-workspace 3"
            ];
          }
          {
            "if" = {
              app-id = "org.whispersystems.signal-desktop";
            };
            run = [
              "move-node-to-workspace 4"
            ];
          }
          {
            "if" = {
              app-id = "com.facebook.archon";
            };
            run = [
              "move-node-to-workspace 4"
            ];
          }
          {
            "if" = {
              app-id = "com.apple.ScreenContinuity"; # iPhone Mirroring
            };
            run = [
              "move-node-to-workspace 5" # Leisure applications
            ];
          }
          {
            "if" = {
              app-id = "com.apple.Safari";
              window-title-regex-substring = "Leisure";
            };
            run = [
              "move-node-to-workspace 5"
            ];
          }
          {
            "if" = {
              app-id = "com.YoStarEN.Arknights";
            };
            run = [
              "move-node-to-workspace 6"
            ];
          }
          {
            "if" = {
              app-id = "net.kovidgoyal.kitty";
            };
            run = [
              "move-node-to-workspace 7"
            ];
          }
          {
            check-further-callbacks = true;
            run = [
              "move-node-to-workspace 8" # Catch-all for other applications
            ];
          }
          {
            "if" = {
              app-id = "tv.parsec.www";
            };
            run = [
              "move-node-to-workspace Z" # Background applications
            ];
          }
        ];
      };
    };

    environment.systemPackages = with pkgs; [
      autoraise # Focus follows mouse
    ];
  };
}