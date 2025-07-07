{
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "workspace 1, title:.*GitHub - Zen Twilight.*"
      "workspace 2, title:.*VGU.*"
      "workspace 3, class:code"
      "workspace 4, class:(signal|Caprine)"
      "workspace 5, title:.*(YouTube|Facebook) — Zen Twilight.*"
      "workspace 6, class:steam"
      "workspace 7, class:kitty"
      "workspace 9, title:Parsec"
    ];

    workspace = [
      "1, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- $browser --new-window https://github.com"
      "2, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- $browser --new-window https://library.vgu.edu.vn/booking/"
      "3, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- $editor"
      "4, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- signal-desktop"
      "5, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- $browser --new-window https://www.youtube.com https://www.facebook.com"
      "6, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
      "7, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- $term"
      "9, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- ${pkgs.parsec-bin}/bin/parsecd"
    ];
  };
}