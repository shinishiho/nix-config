{ ... }:

{
  programs.aerospace.settings.on-window-detected = [
    {
      "if" = {
        app-id = "com.apple.Safari";
        window-title-regex-substring = "W —";
      };
      run = [
        "move-node-to-workspace 1"
      ];
    }
    {
      "if" = {
        app-id = "com.apple.Safari";
        window-title-regex-substring = "VGU —";
      };
      run = [
        "move-node-to-workspace 1"
      ];
    }
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
        app-id = "com.apple.Safari";
        window-title-regex-substring = "Relax —";
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
      "if" = {
        app-id = "com.apple.systempreferences";
      };
      run = [
        "layout floating"
        "move-node-to-workspace 5"
      ];
    }
    {
      "if" = {
        app-id = "com.apple.SecurityAgent";
      };
      run = [
        "layout floating"
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
    {
      "if" = {
        app-id = "com.netease.uuremote";
      };
      run = [
        "move-node-to-workspace Z"
      ];
    }
  ];
}
