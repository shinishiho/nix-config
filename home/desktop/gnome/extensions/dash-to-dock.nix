{
  pkgs,
  ...
}:
{
  programs.gnome-shell.extensions = [ { package = pkgs.gnomeExtensions.dash-to-dock; } ];

  dconf.settings."org/gnome/shell/extensions/dash-to-dock" = {
    background-opacity = 0.1;
    dash-max-icon-size = 42;
    height-fraction = 0.8;
    hotkeys-show-dock = false;
    intellihide = false;
    intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
    scroll-action = "switch-workspace";
    transparency-mode = "FIXED";
    preview-size-scale = 0.17;
    running-indicator-style = "DOTS";
  };
}
