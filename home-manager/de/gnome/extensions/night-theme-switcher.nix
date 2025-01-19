{ pkgs, ... }:
let
  light-theme = "Orchis-Red-Light-Dracula";
  dark-theme = "Orchis-Red-Dark-Dracula";
in
{
  programs.gnome-shell.extensions = [ { package = pkgs.gnomeExtensions.night-theme-switcher; } ];

  dconf.settings."org/gnome/shell/extensions/night-theme-switcher/time" = {
    manual-schedule = true;
    sunset = 18;
  };

  dconf.settings."org/gnome/shell/extensions/nightthemeswitcher/commands" = {
    enabled = true;
    sunrise = "gsettings set org.gnome.shell.extensions.user-theme name ${light-theme} && echo \"export GTK_THEME=${light-theme}\" > ~/.profile";
    sunset = "gsettings set org.gnome.shell.extensions.user-theme name ${dark-theme} && echo \"export GTK_THEME=${dark-theme}\" > ~/.profile";
  };
}
