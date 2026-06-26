{ ... }:

{
  services.paneru.settings.bindings = {
    # Focus within the strip (cmd - h/j/k/l)
    window_focus_west = "cmd - h";
    window_focus_south = "cmd - j";
    window_focus_north = "cmd - k";
    window_focus_east = "cmd - l";

    # Move / swap within the strip (cmd + shift)
    window_swap_west = "cmd + shift - h";
    window_swap_south = "cmd + shift - j";
    window_swap_north = "cmd + shift - k";
    window_swap_east = "cmd + shift - l";

    # Jump to / move to strip ends
    window_focus_first = "cmd - home";
    window_focus_last = "cmd - end";
    window_swap_first = "cmd + shift - home";
    window_swap_last = "cmd + shift - end";

    # Width presets: grow / shrink
    window_resize = "cmd - r";
    window_shrink = "cmd + shift - r";

    # Layout actions (alt, to avoid shadowing macOS Copy/Find/New-Tab)
    window_center = "alt - c";
    window_fullwidth = "alt - f";
    window_manage = "alt - t";

    # Column stacking (alt)
    window_stack = "alt - comma";
    window_unstack = "alt - period";

    # Move window between displays (alt)
    window_nextdisplay = "alt - n";
    window_nextdisplaysend = "alt + shift - n";
    mouse_nextdisplay = "alt + ctrl - n";

    # Virtual workspaces: directional row nav (alt - j/k) + move (alt + shift - j/k)
    window_virtual_north = "alt - k";
    window_virtual_south = "alt - j";
    window_virtualmove_north = "alt + shift - k";
    window_virtualmove_south = "alt + shift - j";

    # Virtual workspaces: jump to numbered row (alt - N)
    window_virtualnum_1 = "alt - 1";
    window_virtualnum_2 = "alt - 2";
    window_virtualnum_3 = "alt - 3";
    window_virtualnum_4 = "alt - 4";
    window_virtualnum_5 = "alt - 5";
    window_virtualnum_6 = "alt - 6";
    window_virtualnum_7 = "alt - 7";
    window_virtualnum_8 = "alt - 8";
    window_virtualnum_9 = "alt - 9";

    # Move window to numbered virtual workspace and follow (alt + shift - N)
    window_virtualmovenum_1 = "alt + shift - 1";
    window_virtualmovenum_2 = "alt + shift - 2";
    window_virtualmovenum_3 = "alt + shift - 3";
    window_virtualmovenum_4 = "alt + shift - 4";
    window_virtualmovenum_5 = "alt + shift - 5";
    window_virtualmovenum_6 = "alt + shift - 6";
    window_virtualmovenum_7 = "alt + shift - 7";
    window_virtualmovenum_8 = "alt + shift - 8";
    window_virtualmovenum_9 = "alt + shift - 9";
  };
}
