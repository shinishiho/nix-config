{
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "workspace 1, match:title .*GitHub - Zen Twilight.*"
      "workspace 2, match:title .*VGU.*"
      "workspace 3, match:title .*(neovim).*"
      "workspace 4, match:class (signal|Caprine)"
      "workspace 5, match:class mpv"
      "workspace 6, match:class steam"
      "workspace 7, match:class kitty"
      "workspace 9, match:title Parsec"
    ];

    workspace = [
      # "1, on-created-empty: ${pkgs.uwsm}/bin/uwsm-app -- $browser --new-window"
      "2, on-created-empty: ${pkgs.uwsm}/bin/uwsm-app -- $browser --new-window"
      "3, on-created-empty: ${pkgs.uwsm}/bin/uwsm-app -- $editor"
      "4, on-created-empty: ${pkgs.uwsm}/bin/uwsm-app -- signal-desktop"
      "5, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
      "6, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false"
      "7, on-created-empty: ${pkgs.uwsm}/bin/uwsm-app -- $term fish -c \"zellij\""
      "9, on-created-empty: ${pkgs.uwsm}/bin/uwsm-app -- ${pkgs.parsec-bin}/bin/parsecd"
      "10, monitor:HDMI-A-1,default:true"
    ];
  };
}
