{ pkgs, ... } : {
  programs.gnome-shell.extensions = [ { package = pkgs.gnomeExtensions.dash-to-dock; } ];

  dconf.settings."org/gnome/shell/extensions/dash-to-dock" = {
    background-opacity = 0.01;
    dash-max-icon-size = 64;
    hotkeys-show-dock = false;
    intellihide = false;
    intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
    scroll-action = "switch-workspace";
    transparency-mode = "FIXED";
  };
}
