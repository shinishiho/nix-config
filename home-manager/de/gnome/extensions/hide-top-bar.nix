{ pkgs, ... } : {
  programs.gnome-shell.extensions = [ { package = pkgs.gnomeExtensions.hide-top-bar; } ];

  dconf.settings."org/gnome/shell/extensions/hidetopbar" = {
    hot-corner = true;
    mouse-sensitive = true;
  };
}
