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
    systemd.enable = false;

    settings = {
      exec-once = [
        "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.swww}/bin/swww-daemon"
        "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.fcitx5}/bin/fcitx5"
        "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.hyprpanel}/bin/hyprpanel"
        "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store"
        "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store"
        # Abomination
        "sleep 1; set-wallpaper init"
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
