{
  pkgs,
  ...
}:

{
  programs.aerospace = {
    enable = true;
    settings = {
      config-version = 2;

      # Normalization settings
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      # Layout configuration
      accordion-padding = 30;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      # Mouse follows focus when focused monitor changes
      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];

      # You can effectively turn off macOS "Hide application" (cmd-h) feature by toggling this flag
      automatically-unhide-macos-hidden-apps = false;

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
            app-id = "app.zen-browser.zen";
          };
          run = [
            "move-node-to-workspace 1"
          ];
        }
        {
          "if" = {
            app-id = "com.microsoft.VSCode";
          };
          run = [
            "move-node-to-workspace 2"
          ];
        }
        {
          "if" = {
            app-id = "dev.zed.Zed";
          };
          run = [
            "move-node-to-workspace 2"
          ];
        }
        {
          "if" = {
            app-id = "net.kovidgoyal.kitty";
          };
          run = [
            "move-node-to-workspace 2"
          ];
        }
        {
          "if" = {
            app-id = "com.apple.ScreenContinuity";
          };
          run = [
            "move-node-to-workspace 3"
          ];
        }
        {
          "if" = {
            app-id = "com.apple.Music";
          };
          run = [
            "move-node-to-workspace 3"
          ];
        }
        {
          "if" = {
            app-id = "io.mpv";
          };
          run = [
            "move-node-to-workspace 3"
          ];
        }
        {
          "if" = {
            app-id = "io.playcover.PlayCover";
          };
          run = [
            "move-node-to-workspace 3"
          ];
        }
        {
          "if" = {
            app-id = "com.hguandl.MeoAsstMac";
          };
          run = [
            "move-node-to-workspace 3"
          ];
        }
        {
          "if" = {
            app-id = "com.YoStarEN.Arknights";
          };
          run = [
            "layout floating"
            "move-node-to-workspace 3"
          ];
        }
        {
          "if" = {
            app-id = "com.gryphline.endfield.ios";
          };
          run = [
            "layout floating"
            "move-node-to-workspace 3"
          ];
        }
        {
          check-further-callbacks = true;
          run = [
            "move-node-to-workspace 4"
          ];
        }
        {
          "if" = {
            app-id = "tv.parsec.www";
          };
          run = [
            "move-node-to-workspace Z"
          ];
        }
      ];
    };
  };
}
