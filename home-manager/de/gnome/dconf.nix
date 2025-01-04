{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/wm/keybindings".close = ["<Super>q" "<Alt>F4"];
      "org/gnome/desktop/wm/preferences".focus-mode = "sloppy";

      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/desktop/interface".cursor-theme = "Bibata-Modern-Classic";
      "org/gnome/desktop/peripherals/touchpad".speed = 1.0;

      "org/gnome/mutter".dynamic-workspaces = true;

      "org/gnome/desktop/background" = {
        picture-uri-dark = "file://${./wallpapers/bg_dark.jpg}";
        picture-uri = "file://${./wallpapers/bg_light.jpg}";
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
