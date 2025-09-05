{
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "workspace 1, title:.*GitHub - Zen Twilight.*"
      "workspace 2, title:.*VGU.*"
      "workspace 3, title: .*(neovim).*"
      "workspace 4, class:(signal|Caprine)"
      "workspace 5, class:mpv"
      "workspace 6, class:steam"
      "workspace 7, class:kitty"
      "workspace 9, title:Parsec"
    ];

    workspace = [
      "1, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- $browser --new-window https://github.com"
      "2, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- $browser --new-window https://mail.google.com"
      "3, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- $editor"
      "4, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- signal-desktop"
      "5, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
      "6, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
      "7, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- $term fish -c \"zellij\""
      "9, on-created-empty: ${pkgs.uwsm}/bin/uwsm app -- ${pkgs.parsec-bin}/bin/parsecd"
      "10, monitor:HDMI-A-1,default:true"
    ];
  };
}
