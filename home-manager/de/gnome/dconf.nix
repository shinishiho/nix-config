{ pkgs, ... } : {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/shell/extensions/Battery-Health-Charging".charging-mode = "bal";
      "org/gnome/desktop/peripherals/touchpad".speed = 1.0;
      "org/gnome/desktop/background".picture-uri-dark = "file://${./wallpapers/bg_dark.jpg}";
      "org/gnome/desktop/background".picture-uri = "file://${./wallpapers/bg_light.jpg}";
      "org/gnome/mutter".dynamic-workspaces = true;
    };
  };

  home.packages = [
    pkgs.dconf-editor
    pkgs.gnome-network-displays
  ];
}
