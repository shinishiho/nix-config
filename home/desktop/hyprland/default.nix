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
    brightnessctl
    grim
    grimblast
    hyprpicker
    slurp
    swappy
    swww
    wf-recorder
    wl-clipboard
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.file.".config/uwsm/env".text = ''
    export QT_QPA_PLATFORM=wayland;xcb
    export QT_QPA_PLATFORMTHEME=qt6ct
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export MOZ_ENABLE_WAYLAND=1
    export GDK_SCALE=1
  '';
}
