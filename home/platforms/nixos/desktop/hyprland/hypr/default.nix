{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./keybindings.nix
    ./peripherals.nix
    ./style.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    settings = {
      exec-once = [
        "mako"
        "fcitx5"
        "kitty tmux"
        "swaybg -c 000000"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
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
