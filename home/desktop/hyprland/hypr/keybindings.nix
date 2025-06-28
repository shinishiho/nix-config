{
  wayland.windowManager.hyprland.settings = {
        "$mod" = "SUPER";
        "$term" = "kitty";
        "$editor" = "code";
        "$file" = "dolphin";
        "$browser" = "firefox";

        bind = [
          # Window/Session actions
          "$mod, Q, killactive,"
          "Alt, F4, exec, killactive,"
          "$mod, Delete, exit,"
          "$mod, W, togglefloating,"
          "$mod, G, togglegroup,"
          "Alt, Return, fullscreen,"
          "$mod, L, exec, swaylock"
          "$mod+Shift, F, exec, $scrPath/windowpin.sh"
          "$mod, Backspace, exec, $scrPath/logoutlaunch.sh"

          # Application shortcuts
          "bind = $mod, Return, exec, $term"
          "bind = $mod, E, exec, $file"
          "bind = $mod, C, exec, $editor"
          "bind = $mod, F, exec, $browser"
        ];
    };

    wayland.windowManager.hyprland.extraConfig = ''
      # Rofi menus
      bind = $mod, space, exec, pkill -x rofi || rofi -show drun
      bind = $mod, Tab, exec, pkill -x rofi || $scrPath/rofilaunch.sh w # launch window switcher
      bind = $mod+Shift, E, exec, pkill -x rofi || $scrPath/rofilaunch.sh f # launch file explorer

      # Media control
      bindl  = , XF86AudioPlay, exec, playerctl play-pause # toggle between media play and pause
      bindl  = , XF86AudioPause, exec, playerctl play-pause # toggle between media play and pause
      bindl  = , XF86AudioNext, exec, playerctl next # media next
      bindl  = , XF86AudioPrev, exec, playerctl previous # media previous

      # Move between grouped windows
      bind = $mod CTRL , H, changegroupactive, b
      bind = $mod CTRL , L, changegroupactive, f

      # Screenshot/Screencapture
      bind = $mod, P, exec, $scrPath/screenshot.sh s # partial screenshot capture
      bind = $mod+Ctrl, P, exec, $scrPath/screenshot.sh sf # partial screenshot capture (frozen screen)
      bind = $mod+Alt, P, exec, $scrPath/screenshot.sh m # monitor screenshot capture
      bind = , Print, exec, $scrPath/screenshot.sh p # all monitors screenshot capture

      # Custom scripts
      bind = $mod+Alt, G, exec, $scrPath/gamemode.sh # disable hypr effects for gamemode
      bind = $mod+Alt, Right, exec, $scrPath/swwwallpaper.sh -n # next wallpaper
      bind = $mod+Alt, Left, exec, $scrPath/swwwallpaper.sh -p # previous wallpaper
      bind = $mod+Shift, R, exec, pkill -x rofi || $scrPath/wallbashtoggle.sh -m # launch wallbash mode select menu
      bind = $mod+Shift, T, exec, pkill -x rofi || $scrPath/themeselect.sh # launch theme select menu
      bind = $mod+Shift, A, exec, pkill -x rofi || $scrPath/rofiselect.sh # launch select menu
      bind = $mod+Shift, W, exec, pkill -x rofi || $scrPath/swwwallselect.sh # launch wallpaper select menu
      bind = $mod, V, exec, pkill -x rofi || $scrPath/cliphist.sh c # launch clipboard
      bind = $mod, K, exec, $scrPath/keyboardswitch.sh # switch keyboard layout
      bind = $mod, slash, exec, pkill -x rofi || $scrPath/keybinds_hint.sh c # launch keybinds hint

      # Move/Change window focus
      bind = $mod, Left, movefocus, l
      bind = $mod, Right, movefocus, r
      bind = $mod, Up, movefocus, u
      bind = $mod, Down, movefocus, d
      bind = Alt, Tab, movefocus, d

      # Switch workspaces
      bind = $mod, 1, workspace, 1
      bind = $mod, 2, workspace, 2
      bind = $mod, 3, workspace, 3
      bind = $mod, 4, workspace, 4
      bind = $mod, 5, workspace, 5
      bind = $mod, 6, workspace, 6
      bind = $mod, 7, workspace, 7
      bind = $mod, 8, workspace, 8
      bind = $mod, 9, workspace, 9
      bind = $mod, 0, workspace, 10

      # Switch workspaces to a relative workspace
      bind = $mod+Ctrl, Right, workspace, r+1
      bind = $mod+Ctrl, Left, workspace, r-1

      # Move to the first empty workspace
      bind = $mod+Ctrl, Down, workspace, empty

      # Resize windows
      binde = $mod+Shift, Right, resizeactive, 30 0
      binde = $mod+Shift, Left, resizeactive, -30 0
      binde = $mod+Shift, Up, resizeactive, 0 -30
      binde = $mod+Shift, Down, resizeactive, 0 30

      # Move focused window to a workspace
      bind = $mod+Shift, 1, movetoworkspace, 1
      bind = $mod+Shift, 2, movetoworkspace, 2
      bind = $mod+Shift, 3, movetoworkspace, 3
      bind = $mod+Shift, 4, movetoworkspace, 4
      bind = $mod+Shift, 5, movetoworkspace, 5
      bind = $mod+Shift, 6, movetoworkspace, 6
      bind = $mod+Shift, 7, movetoworkspace, 7
      bind = $mod+Shift, 8, movetoworkspace, 8
      bind = $mod+Shift, 9, movetoworkspace, 9
      bind = $mod+Shift, 0, movetoworkspace, 10

      # Move focused window to a relative workspace
      bind = $mod+Ctrl+Alt, Right, movetoworkspace, r+1
      bind = $mod+Ctrl+Alt, Left, movetoworkspace, r-1

      # Move active window around current workspace with mod + SHIFT + CTRL [←→↑↓]
      $moveactivewindow=grep -q \"true\" <<< $(hyprctl activewindow -j | jq -r .floating) && hyprctl dispatch moveactive
      binded = $mod SHIFT $CONTROL, left,Move activewindow to the right,exec, $moveactivewindow -30 0 || hyprctl dispatch movewindow l
      binded = $mod SHIFT $CONTROL, right,Move activewindow to the right,exec, $moveactivewindow 30 0 || hyprctl dispatch movewindow r
      binded = $mod SHIFT $CONTROL, up,Move activewindow to the right,exec, $moveactivewindow  0 -30 || hyprctl dispatch movewindow u
      binded = $mod SHIFT $CONTROL, down,Move activewindow to the right,exec, $moveactivewindow 0 30 || hyprctl dispatch movewindow d

      # Scroll through existing workspaces
      bind = $mod, mouse_down, workspace, e+1
      bind = $mod, mouse_up, workspace, e-1

      # Move/Resize focused window
      bindm = $mod, mouse:272, movewindow
      bindm = $mod, mouse:273, resizewindow
      bindm = $mod, Z, movewindow
      bindm = $mod, X, resizewindow

      # Move/Switch to special workspace (scratchpad)
      bind = $mod+Alt, S, movetoworkspacesilent, special
      bind = $mod, S, togglespecialworkspace,

      # Toggle focused window split
      bind = $mod, J, togglesplit

      # Move focused window to a workspace silently
      bind = $mod+Alt, 1, movetoworkspacesilent, 1
      bind = $mod+Alt, 2, movetoworkspacesilent, 2
      bind = $mod+Alt, 3, movetoworkspacesilent, 3
      bind = $mod+Alt, 4, movetoworkspacesilent, 4
      bind = $mod+Alt, 5, movetoworkspacesilent, 5
      bind = $mod+Alt, 6, movetoworkspacesilent, 6
      bind = $mod+Alt, 7, movetoworkspacesilent, 7
      bind = $mod+Alt, 8, movetoworkspacesilent, 8
      bind = $mod+Alt, 9, movetoworkspacesilent, 9
      bind = $mod+Alt, 0, movetoworkspacesilent, 10
    '';
}
