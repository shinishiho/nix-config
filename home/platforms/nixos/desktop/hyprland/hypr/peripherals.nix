{
  wayland.windowManager.hyprland.settings = {
    monitor = ",preferred,auto,1";

    input = {
      kb_layout = "us";
      kb_options = "caps:swapescape";
      follow_mouse = 1;

      touchpad = {
        natural_scroll = false;
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
  };
}
