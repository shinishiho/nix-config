{ lib, ... }:
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/wm/keybindings".close = [
        "<Super>q"
        "<Alt>F4"
      ];
      "org/gnome/desktop/wm/preferences".focus-mode = "sloppy";
      "org/gnome/desktop/peripherals/touchpad".speed = 1.0;

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        cursor-theme = "Bibata-Modern-Classic";
        show-battery-percentage = true;
      };

      "org/gnome/desktop/sound".allow-volume-above-100-percent = true;

      "org/gnome/mutter" = {
        dynamic-workspaces = true;
        workspaces-only-on-primary = true;
      };

      "org/gnome/desktop/background" = {
        picture-uri-dark = "file://${./wallpapers/bg_dark.jpg}";
        picture-uri = "file://${./wallpapers/bg_light.jpg}";
      };

      "org/gnome/settings-daemon/plugins/color" = {
        night-light-enabled = true;
        night-light-schedule-automatic = true;
        night-light-temperature = lib.hm.gvariant.mkUint32 4000;
      };

      "org/gnome/nautilus/preferences" = {
        recursive-search = "always";
        show-create-link = true;
        show-delete-permanently = true;
        show-directory-item-counts = "always";
        show-image-thumbnails = "always";
      };
    };
  };
}
