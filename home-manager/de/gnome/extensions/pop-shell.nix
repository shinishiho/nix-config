{ pkgs, ... } : {
  programs.gnome-shell.extensions = [ { package = pkgs.gnomeExtensions.pop-shell; } ];

  dconf.settings."org/gnome/shell/extensions/pop-shell" = {
    active-hint = true;
    active-hint-border-radius = 2;
    hint-color-rgba = "rgba(150, 0, 0, 1)";
    show-title = false;
    smart-gaps = true;
    tile-by-default = true;
    tile-enter = [ "<Super>t" ];
  };
}
