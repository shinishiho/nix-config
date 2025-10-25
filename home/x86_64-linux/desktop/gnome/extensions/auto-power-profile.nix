{
  pkgs,
  ...
}:
{
  programs.gnome-shell.extensions = [ { package = pkgs.gnomeExtensions.auto-power-profile; } ];

  dconf.settings."org/gnome/shell/extensions/auto-power-profile".threshold = 40;
}
