{ pkgs, ... }:

{
  programs.aerospace.settings.mode.main.binding = {
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
}
