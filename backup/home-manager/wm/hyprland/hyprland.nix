{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";

      monitor = ",preferred,auto,1";

      exec-once = [
        "mako"
        "fcitx5"
        "kitty tmux"
        "swaybg -c 000000"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      env = [
        "XDG_CURRENT_DESKTOP=Hyprland"
        "XDG_SESSION_TYPE=wayland"
        "XDG_SESSION_DESKTOP=Hyprland"
        "QT_QPA_PLATFORM=wayland;xcb"
        "QT_QPA_PLATFORMTHEME=qt6ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION=1"
        "QT_AUTO_SCREEN_SCALE_FACTOR=1"
        "MOZ_ENABLE_WAYLAND=1"
        "GDK_SCALE=1"
      ];

      input = {
        kb_layout = "us";
        kb_options = "caps:swapescape";
        follow_mouse = 1;

        touchpad = {
          natural_scroll = "no";
        };

        sensitivity = 0;
        force_no_accel = 1;
      };

      device = {
        #name = "epic mouse V1";
        #sensitivity = -0.5;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        no_gaps_when_only = 1;
      };

      master = {
        new_status = "master";
        no_gaps_when_only = 1;
      };

      misc = {
        vrr = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      animations = {
        enabled = "yes";
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];

        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      general = {
        gaps_in = 3;
        gaps_out = 8;
        border_size = 2;
        "col.active_border" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
        "col.inactive_border" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
        layout = "dwindle";
        resize_on_border = true;
      };

      group = {
        "col.border_active" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
        "col.border_inactive" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
        "col.border_locked_active" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
        "col.border_locked_inactive" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
      };

      decoration = {
        rounding = 10;
        drop_shadow = false;

        blur = {
          enabled = "yes";
          size = 6;
          passes = 3;
          new_optimizations = "on";
          ignore_opacity = "on";
          xray = false;
        };
      };

      windowrulev2 = [
        "opacity 0.90 0.90,class:^(firefox)$"
        "opacity 0.90 0.90,class:^(Brave-browser)$"
        "opacity 0.80 0.80,class:^(code-oss)$"
        "opacity 0.80 0.80,class:^(Code)$"
        "opacity 0.80 0.80,class:^(code-url-handler)$"
        "opacity 0.80 0.80,class:^(code-insiders-url-handler)$"
        "opacity 0.80 0.80,class:^(kitty)$"
        "opacity 0.80 0.80,class:^(org.kde.dolphin)$"
        "opacity 0.80 0.80,class:^(org.kde.ark)$"
        "opacity 0.80 0.80,class:^(nwg-look)$"
        "opacity 0.80 0.80,class:^(qt5ct)$"
        "opacity 0.80 0.80,class:^(qt6ct)$"
        "opacity 0.80 0.80,class:^(kvantummanager)$"
        "opacity 0.80 0.70,class:^(org.pulseaudio.pavucontrol)$"
        "opacity 0.80 0.70,class:^(blueman-manager)$"
        "opacity 0.80 0.70,class:^(nm-applet)$"
        "opacity 0.80 0.70,class:^(nm-connection-editor)$"
        "opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "opacity 0.80 0.70,class:^(polkit-gnome-authentication-agent-1)$"
        "opacity 0.80 0.70,class:^(org.freedesktop.impl.portal.desktop.gtk)$"
        "opacity 0.80 0.70,class:^(org.freedesktop.impl.portal.desktop.hyprland)$"
        "opacity 0.70 0.70,class:^([Ss]team)$"
        "opacity 0.70 0.70,class:^(steamwebhelper)$"
        "opacity 0.70 0.70,class:^(Spotify)$"
        "opacity 0.70 0.70,initialTitle:^(Spotify Free)$"
        "opacity 0.90 0.90,class:^(com.github.rafostar.Clapper)$"
        "opacity 0.80 0.80,class:^(com.github.tchx84.Flatseal)$"
        "opacity 0.80 0.80,class:^(hu.kramo.Cartridges)$"
        "opacity 0.80 0.80,class:^(com.obsproject.Studio)$"
        "opacity 0.80 0.80,class:^(gnome-boxes)$"
        "opacity 0.80 0.80,class:^(discord)$"
        "opacity 0.80 0.80,class:^(WebCord)$"
        "opacity 0.80 0.80,class:^(ArmCord)$"
        "opacity 0.80 0.80,class:^(app.drey.Warp)$"
        "opacity 0.80 0.80,class:^(net.davidotek.pupgui2)$"
        "opacity 0.80 0.80,class:^(yad)$"
        "opacity 0.80 0.80,class:^(Signal)$"
        "opacity 0.80 0.80,class:^(io.github.alainm23.planify)$"
        "opacity 0.80 0.80,class:^(io.gitlab.theevilskeleton.Upscaler)$"
        "opacity 0.80 0.80,class:^(com.github.unrud.VideoDownloader)$"
        "opacity 0.80 0.80,class:^(io.gitlab.adhami3310.Impression)$"
        "opacity 0.80 0.80,class:^(io.missioncenter.MissionCenter)$"
        "opacity 0.80 0.80,class:^(io.github.flattool.Warehouse)$"
        "float,class:^(org.kde.dolphin)$,title:^(Progress Dialog — Dolphin)$"
        "float,class:^(org.kde.dolphin)$,title:^(Copying — Dolphin)$"
        "float,title:^(About Mozilla Firefox)$"
        "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
        "float,class:^(firefox)$,title:^(Library)$"
        "float,class:^(kitty)$,title:^(top)$"
        "float,class:^(kitty)$,title:^(btop)$"
        "float,class:^(kitty)$,title:^(htop)$"
        "float,class:^(vlc)$"
        "float,class:^(kvantummanager)$"
        "float,class:^(qt5ct)$"
        "float,class:^(qt6ct)$"
        "float,class:^(nwg-look)$"
        "float,class:^(org.kde.ark)$"
        "float,class:^(org.pulseaudio.pavucontrol)$"
        "float,class:^(blueman-manager)$"
        "float,class:^(nm-applet)$"
        "float,class:^(nm-connection-editor)$"
        "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "float,class:^(Signal)$"
        "float,class:^(com.github.rafostar.Clapper)$"
        "float,class:^(app.drey.Warp)$"
        "float,class:^(net.davidotek.pupgui2)$"
        "float,class:^(yad)$"
        "float,class:^(eog)$"
        "float,class:^(io.github.alainm23.planify)$"
        "float,class:^(io.gitlab.theevilskeleton.Upscaler)$"
        "float,class:^(com.github.unrud.VideoDownloader)$"
        "float,class:^(io.gitlab.adhami3310.Impression)$"
        "float,class:^(io.missioncenter.MissionCenter)$"
      ];

      layerrule = [
        "blur,rofi"
        "ignorezero,rofi"
        "blur,notifications"
        "ignorezero,notifications"
        "blur,swaync-notification-window"
        "ignorezero,swaync-notification-window"
        "blur,swaync-control-center"
        "ignorezero,swaync-control-center"
        "blur,logout_dialog"
      ];
    };

    extraConfig = ''
      # Main modifier
      $mainMod = Super # super / meta / windows key

      # Assign apps
      $term = kitty
      $editor = code
      $file = dolphin
      $browser = firefox

      # Window/Session actions
      bind = $mainMod, Q, killactive,
      bind = Alt, F4, exec, killactive,
      bind = $mainMod, Delete, exit, # kill hyprland session
      bind = $mainMod, W, togglefloating, # toggle the window between focus and float
      bind = $mainMod, G, togglegroup, # toggle the window between focus and group
      bind = Alt, Return, fullscreen, # toggle the window between focus and fullscreen
      bind = $mainMod, L, exec, swaylock # launch lock screen
      bind = $mainMod+Shift, F, exec, $scrPath/windowpin.sh # toggle pin on focused window
      bind = $mainMod, Backspace, exec, $scrPath/logoutlaunch.sh # launch logout menu

      # Application shortcuts
      bind = $mainMod, T, exec, $term # launch terminal emulator
      bind = $mainMod, E, exec, $file # launch file manager
      bind = $mainMod, C, exec, $editor # launch text editor
      bind = $mainMod, F, exec, $browser # launch web browser

      # Rofi menus
      bind = $mainMod, space, exec, pkill -x rofi || rofi -show drun
      bind = $mainMod, Tab, exec, pkill -x rofi || $scrPath/rofilaunch.sh w # launch window switcher
      bind = $mainMod+Shift, E, exec, pkill -x rofi || $scrPath/rofilaunch.sh f # launch file explorer

      # Media control
      bindl  = , XF86AudioPlay, exec, playerctl play-pause # toggle between media play and pause
      bindl  = , XF86AudioPause, exec, playerctl play-pause # toggle between media play and pause
      bindl  = , XF86AudioNext, exec, playerctl next # media next
      bindl  = , XF86AudioPrev, exec, playerctl previous # media previous

      # Move between grouped windows
      bind = $mainMod CTRL , H, changegroupactive, b
      bind = $mainMod CTRL , L, changegroupactive, f

      # Screenshot/Screencapture
      bind = $mainMod, P, exec, $scrPath/screenshot.sh s # partial screenshot capture
      bind = $mainMod+Ctrl, P, exec, $scrPath/screenshot.sh sf # partial screenshot capture (frozen screen)
      bind = $mainMod+Alt, P, exec, $scrPath/screenshot.sh m # monitor screenshot capture
      bind = , Print, exec, $scrPath/screenshot.sh p # all monitors screenshot capture

      # Custom scripts
      bind = $mainMod+Alt, G, exec, $scrPath/gamemode.sh # disable hypr effects for gamemode
      bind = $mainMod+Alt, Right, exec, $scrPath/swwwallpaper.sh -n # next wallpaper
      bind = $mainMod+Alt, Left, exec, $scrPath/swwwallpaper.sh -p # previous wallpaper
      bind = $mainMod+Shift, R, exec, pkill -x rofi || $scrPath/wallbashtoggle.sh -m # launch wallbash mode select menu
      bind = $mainMod+Shift, T, exec, pkill -x rofi || $scrPath/themeselect.sh # launch theme select menu
      bind = $mainMod+Shift, A, exec, pkill -x rofi || $scrPath/rofiselect.sh # launch select menu
      bind = $mainMod+Shift, W, exec, pkill -x rofi || $scrPath/swwwallselect.sh # launch wallpaper select menu
      bind = $mainMod, V, exec, pkill -x rofi || $scrPath/cliphist.sh c # launch clipboard
      bind = $mainMod, K, exec, $scrPath/keyboardswitch.sh # switch keyboard layout
      bind = $mainMod, slash, exec, pkill -x rofi || $scrPath/keybinds_hint.sh c # launch keybinds hint

      # Move/Change window focus
      bind = $mainMod, Left, movefocus, l
      bind = $mainMod, Right, movefocus, r
      bind = $mainMod, Up, movefocus, u
      bind = $mainMod, Down, movefocus, d
      bind = Alt, Tab, movefocus, d

      # Switch workspaces
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Switch workspaces to a relative workspace
      bind = $mainMod+Ctrl, Right, workspace, r+1
      bind = $mainMod+Ctrl, Left, workspace, r-1

      # Move to the first empty workspace
      bind = $mainMod+Ctrl, Down, workspace, empty

      # Resize windows
      binde = $mainMod+Shift, Right, resizeactive, 30 0
      binde = $mainMod+Shift, Left, resizeactive, -30 0
      binde = $mainMod+Shift, Up, resizeactive, 0 -30
      binde = $mainMod+Shift, Down, resizeactive, 0 30

      # Move focused window to a workspace
      bind = $mainMod+Shift, 1, movetoworkspace, 1
      bind = $mainMod+Shift, 2, movetoworkspace, 2
      bind = $mainMod+Shift, 3, movetoworkspace, 3
      bind = $mainMod+Shift, 4, movetoworkspace, 4
      bind = $mainMod+Shift, 5, movetoworkspace, 5
      bind = $mainMod+Shift, 6, movetoworkspace, 6
      bind = $mainMod+Shift, 7, movetoworkspace, 7
      bind = $mainMod+Shift, 8, movetoworkspace, 8
      bind = $mainMod+Shift, 9, movetoworkspace, 9
      bind = $mainMod+Shift, 0, movetoworkspace, 10

      # Move focused window to a relative workspace
      bind = $mainMod+Ctrl+Alt, Right, movetoworkspace, r+1
      bind = $mainMod+Ctrl+Alt, Left, movetoworkspace, r-1

      # Move active window around current workspace with mainMod + SHIFT + CTRL [←→↑↓]
      $moveactivewindow=grep -q \"true\" <<< $(hyprctl activewindow -j | jq -r .floating) && hyprctl dispatch moveactive
      binded = $mainMod SHIFT $CONTROL, left,Move activewindow to the right,exec, $moveactivewindow -30 0 || hyprctl dispatch movewindow l
      binded = $mainMod SHIFT $CONTROL, right,Move activewindow to the right,exec, $moveactivewindow 30 0 || hyprctl dispatch movewindow r
      binded = $mainMod SHIFT $CONTROL, up,Move activewindow to the right,exec, $moveactivewindow  0 -30 || hyprctl dispatch movewindow u
      binded = $mainMod SHIFT $CONTROL, down,Move activewindow to the right,exec, $moveactivewindow 0 30 || hyprctl dispatch movewindow d

      # Scroll through existing workspaces
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/Resize focused window
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
      bindm = $mainMod, Z, movewindow
      bindm = $mainMod, X, resizewindow

      # Move/Switch to special workspace (scratchpad)
      bind = $mainMod+Alt, S, movetoworkspacesilent, special
      bind = $mainMod, S, togglespecialworkspace,

      # Toggle focused window split
      bind = $mainMod, J, togglesplit

      # Move focused window to a workspace silently
      bind = $mainMod+Alt, 1, movetoworkspacesilent, 1
      bind = $mainMod+Alt, 2, movetoworkspacesilent, 2
      bind = $mainMod+Alt, 3, movetoworkspacesilent, 3
      bind = $mainMod+Alt, 4, movetoworkspacesilent, 4
      bind = $mainMod+Alt, 5, movetoworkspacesilent, 5
      bind = $mainMod+Alt, 6, movetoworkspacesilent, 6
      bind = $mainMod+Alt, 7, movetoworkspacesilent, 7
      bind = $mainMod+Alt, 8, movetoworkspacesilent, 8
      bind = $mainMod+Alt, 9, movetoworkspacesilent, 9
      bind = $mainMod+Alt, 0, movetoworkspacesilent, 10
    '';
  };
}
