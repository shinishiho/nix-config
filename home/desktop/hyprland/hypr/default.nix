{
  inputs,
  pkgs,
  wallpapers,
  ...
}:
{
  imports = [
    ./keybindings.nix
    ./peripherals.nix
    ./style.nix
    ./workspaces.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    # systemd.enable = false;

    settings = {
      exec-once = [
        "fctix5"
        "${pkgs.swww}/bin/swww-daemon"
        "${pkgs.hyprpanel}/bin/hyprpanel"
        "${pkgs.wlsunset}/bin/wlsunset -s 20:00 -S 07:00"
        "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store"
        "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store"

        # "${pkgs.uwsm}/bin/uwsm app -- fcitx5"
        # "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.swww}/bin/swww-daemon"
        # "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.hyprpanel}/bin/hyprpanel"
        # "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.wlsunset}/bin/wlsunset -s 20:00 -S 07:00"
        # "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store"
        # "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store"
        # Abomination
        "sleep 1 && set-wallpaper init && ${pkgs.hyprpanel}/bin/hyprpanel restart"
      ];

      env = [
        "XDG_CURRENT_DESKTOP=Hyprland"
        "XDG_SESSION_TYPE=wayland"
        "XDG_SESSION_DESKTOP=Hyprland"
        "QT_QPA_PLATFORM=wayland;xcb"
        "QT_QPA_PLATFORMTHEME=qt6ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION=1"
        "QT_AUTO_SCREEN_SCALE_FACTOR=1"
        "MOZ_ENABLE_WAYLAND=1"
        "GDK_SCALE=1"
      ];
    };
  };
}
