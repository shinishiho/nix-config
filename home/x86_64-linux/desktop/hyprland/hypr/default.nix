{
  pkgs,
  ...
}:

{
  imports = [
    ./gestures.nix
    ./keybindings.nix
    ./parsec-submap.nix
    ./peripherals.nix
    ./style.nix
    ./workspaces.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = false;

    settings = {
      exec-once = [
        "${pkgs.uwsm}/bin/uwsm app -- fcitx5"
        "${pkgs.uwsm}/bin/uwsm app -- parsec-submap"
        "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.swww}/bin/swww-daemon"
        "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.hyprpanel}/bin/hyprpanel"
        "${pkgs.uwsm}/bin/uwsm app -- ${pkgs.wlsunset}/bin/wlsunset -s 20:00 -S 07:00"
        # Abomination
        "sleep 1 && set-wallpaper init && ${pkgs.hyprpanel}/bin/hyprpanel restart"
      ];
    };
  };
}
