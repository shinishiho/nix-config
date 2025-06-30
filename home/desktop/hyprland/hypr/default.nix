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

    settings = {
      exec-once = [
        "${pkgs.fcitx5}/bin/fcitx5"
        "${pkgs.swaybg}/bin/swaybg -i ${wallpapers.dark}"
        "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store"
        "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store"
        "${pkgs.hyprpanel}/bin/hyprpanel"
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
