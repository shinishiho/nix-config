{ pkgs, ... }:
{
  programs.gnome-shell.extensions = [ { package = pkgs.gnomeExtensions.pop-shell; } ];

  dconf.settings."org/gnome/shell/extensions/pop-shell" = {
    active-hint = false;
    active-hint-border-radius = 8;
    hint-color-rgba = "rgba(150, 0, 0, 1)";
    show-title = false;
    smart-gaps = true;
    tile-by-default = true;
    tile-enter = [ "<Super>t" ];
  };

  home.file."pop-shell-config" = {
    enable = true;
    target = ".config/pop-shell/config.json";
    text = ''
      {
        "float": [
          {
            "class": "^waydroid.*$",
            "title": ""
          }
        ],
        "skiptaskbarhidden": [],
        "log_on_focus": false
      }
    '';
  };
}
