{ pkgs, ... }:
let
  light-theme = "Orchis-Red-Light-Dracula";
  dark-theme = "Orchis-Red-Dark-Dracula";
in
{
  programs.gnome-shell.extensions = [ { package = pkgs.gnomeExtensions.night-theme-switcher; } ];

  dconf.settings."org/gnome/shell/extensions/nightthemeswitcher/time" = {
    manual-schedule = true;
    sunset = 18;
  };

  dconf.settings."org/gnome/shell/extensions/nightthemeswitcher/commands" = {
    enabled = true;
    sunrise = "gsettings set org.gnome.shell.extensions.user-theme name ${light-theme} && systemctl --user set-environment GTK_THEME=${light-theme}";
    sunset = "gsettings set org.gnome.shell.extensions.user-theme name ${dark-theme} && systemctl --user set-environment GTK_THEME=${dark-theme}";
  };
}
