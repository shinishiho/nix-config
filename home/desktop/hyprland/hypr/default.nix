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
        "${pkgs.uwsm}/bin/uwsm app -- fcitx5"
        "${pkgs.uwsm}/bin/uwsm app -- plover"
        "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.swww}/bin/swww-daemon"
        "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.hyprpanel}/bin/hyprpanel"
        "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.wlsunset}/bin/wlsunset -s 20:00 -S 07:00"
        "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store"
        "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store"
        # Abomination
        "sleep 1 && set-wallpaper init && ${pkgs.hyprpanel}/bin/hyprpanel restart"
      ];
    };
  };
}
