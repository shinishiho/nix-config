{
  pkgs,
  ...
}:
{
  imports = [
    ./hypr
    ./hyprpanel.nix
    ./rofi.nix
    ./wallust.nix
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 25;
  };

  home.packages = with pkgs; [
    grim
    grimblast
    slurp
    swappy
    # swww
    wf-recorder
    wl-clipboard
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.file = {
    ".config/uwsm/env".text = ''
      export QT_QPA_PLATFORM=wayland;xcb
      export QT_QPA_PLATFORMTHEME=qt6ct
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export QT_AUTO_SCREEN_SCALE_FACTOR=1
      export MOZ_ENABLE_WAYLAND=1
      export GDK_SCALE=1
    '';
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      # xdg-desktop-portal-hyprland # Bundled in Hyprland module
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
    ];
    configPackages = with pkgs; [
      xdg-desktop-portal-gtk
      # xdg-desktop-portal-hyprland
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
    ];
    config.common = {
      default = ["gnome" "hyprland" "gtk"];
      "org.freedesktop.impl.portal.Settings" = "gnome";
    };
  };
}
