{ pkgs, ... } : {
  programs.gnome-shell.extensions = [ { package = pkgs.gnomeExtensions.user-themes; } ];

  dconf.settings."org/gnome/shell/extensions/user-theme".name = "Orchis-Red-Dark-Dracula";
}
