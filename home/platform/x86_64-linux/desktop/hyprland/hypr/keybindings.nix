{
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
      "$term" = "kitty";
      "$editor" = "kitty fish -c \"zellij a neovim || zellij -s neovim\"";
      "$file" = "dolphin";
      "$browser" = "zen-twilight";

      bind = [
        # Window/Session actions
        "$mod, Q, killactive,"
        "Alt, F4, exec, killactive,"
        "$mod, Delete, exit,"
        "$mod, W, togglefloating,"
        "$mod, G, togglegroup,"
        "$mod+Ctrl, F, fullscreen,"
        "$mod, L, exec, swaylock"
        "$mod+Shift, F, exec, $scrPath/windowpin.sh"
        "$mod, Backspace, exec, $scrPath/logoutlaunch.sh"

        # Application shortcuts
        "Alt, Return, exec, uwsm app -- $term"

        # Rofi menus
        "$mod, space, exec, pkill -x rofi || rofi -show combi -combi-modes \"run,drun\" -run-command \"uwsm app -- {cmd}\""
        "Alt, space, exec, pkill -x rofi || rofi -show combi -combi-modes \"run,drun\" -run-command \"uwsm app -- {cmd}\""
        "$mod, Tab, exec, pkill -x rofi || rofi -show window"
        "Alt, Tab, exec, pkill -x rofi || rofi -show window"
        "$mod+Shift, W, exec, set-wallpaper select"

        # Switch workspaces
        "Alt, 1, workspace, 1"
        "Alt, 2, workspace, 2"
        "Alt, 3, workspace, 3"
        "Alt, 4, workspace, 4"
        "Alt, 5, workspace, 5"
        "Alt, 6, workspace, 6"
        "Alt, 7, workspace, 7"
        "Alt, 8, workspace, 8"
        "Alt, 9, workspace, 9"
        "Alt, 0, workspace, 10"

        # Switch workspaces to a relative workspace
        "$mod+Ctrl, Right, workspace, r+1"
        "$mod+Ctrl, Left, workspace, r-1"

        # Move to the first empty workspace
        "$mod+Ctrl, Down, workspace, empty"

        # Move focused window to a workspace
        "Alt+Shift, 1, movetoworkspace, 1"
        "Alt+Shift, 2, movetoworkspace, 2"
        "Alt+Shift, 3, movetoworkspace, 3"
        "Alt+Shift, 4, movetoworkspace, 4"
        "Alt+Shift, 5, movetoworkspace, 5"
        "Alt+Shift, 6, movetoworkspace, 6"
        "Alt+Shift, 7, movetoworkspace, 7"
        "Alt+Shift, 8, movetoworkspace, 8"
        "Alt+Shift, 9, movetoworkspace, 9"
        "Alt+Shift, 0, movetoworkspace, 10"

        # Move focused window to a relative workspace
        "$mod+Ctrl+Alt, Right, movetoworkspace, r+1"
        "$mod+Ctrl+Alt, Left, movetoworkspace, r-1"

        # Scroll through existing workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        # Move/Switch to special workspace (scratchpad)
        "$mod+Alt, S, movetoworkspacesilent, special"
        "$mod, S, togglespecialworkspace,"

        # Toggle focused window split
        "$mod, J, togglesplit"

        # Move focused window to a workspace silently
        "$mod+Alt, 1, movetoworkspacesilent, 1"
        "$mod+Alt, 2, movetoworkspacesilent, 2"
        "$mod+Alt, 3, movetoworkspacesilent, 3"
        "$mod+Alt, 4, movetoworkspacesilent, 4"
        "$mod+Alt, 5, movetoworkspacesilent, 5"
        "$mod+Alt, 6, movetoworkspacesilent, 6"
        "$mod+Alt, 7, movetoworkspacesilent, 7"
        "$mod+Alt, 8, movetoworkspacesilent, 8"
        "$mod+Alt, 9, movetoworkspacesilent, 9"
        "$mod+Alt, 0, movetoworkspacesilent, 10"

        # Screenshots
        ", Print, exec, GRIMBLAST_HIDE_CURSOR=1 grimblast copysave area"
      ];

      binde = [
        # Resize windows
        "$mod+Shift, Right, resizeactive, 30 0"
        "$mod+Shift, Left, resizeactive, -30 0"
        "$mod+Shift, Up, resizeactive, 0 -30"
        "$mod+Shift, Down, resizeactive, 0 30"
      ];

      bindel = [
        ", XF86AudioLowerVolume, exec, hyprpanel vol -5"
        ", XF86AudioRaiseVolume, exec, hyprpanel vol +5"
        # ", XF86AudioMute, exec, hyprpanel volume toggle"
        ", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"
        ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set +5%"
      ];
    };

    submaps = {
      disabled = {
        settings.bind = [
          "$mod, escape, submap, reset"
        ];
      };
    };
  };
}
