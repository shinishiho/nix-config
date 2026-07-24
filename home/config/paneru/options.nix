{ ... }:

{
  services.paneru.settings = {
    options = {
      mouse_follows_focus = false;
      preset_column_widths = [
        0.33
        0.5
        0.66
        0.98
      ];
      reap_empty_workspaces = true;
    };

    swipe.gesture.fingers_count = 3;
  };
}
