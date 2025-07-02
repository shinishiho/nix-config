{
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "workspace 1, class:chromium-browser"
      "workspace 2, class:firefox"
      "workspace 3, class:code"
      "workspace 4, class:signal"
      # "workspace 5, class:youtube"
      "workspace 7, class:kitty"
      "workspace 9, title:Parsec"
    ];

    workspace = [
      "1, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- $browser"
      "2, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- $browser"
      "3, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- $editor"
      # "4, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- $signal"
      "6, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
      "7, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- $term"
      "9, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- ${pkgs.parsec-bin}/bin/parsecd"
    ];
  };
}