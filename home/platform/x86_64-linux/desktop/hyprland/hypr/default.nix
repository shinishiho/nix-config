{
  pkgs,
  ...
}:

{
  imports = [
    ./gestures.nix
    ./keybindings.nix
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

  home.packages = with pkgs; [
    (writeShellScriptBin "parsec-submap" ''
SOCK="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

last_state="other" # can be "parsec" or "other"

handle_event() {
    case "$1" in
        activewindow*)
            line="''${1#*>>}"

            if [[ "$line" == *","* ]]; then
                class=$(echo "$line" | cut -d',' -f1)
                title=$(echo "$line" | cut -d',' -f2-)

                if [[ "$title" == *"Parsec"* ]]; then
                    if [[ "$last_state" != "parsec" ]]; then
                        hyprctl dispatch submap disabled
                        last_state="parsec"
                    fi
                else
                    if [[ "$last_state" != "other" ]]; then
                        hyprctl dispatch submap reset
                        last_state="other"
                    fi
                fi
            fi
            ;;
    esac
}

${pkgs.socat}/bin/socat -U - UNIX-CONNECT:"$SOCK" | while read -r line; do
    handle_event "$line"
done
    '')
  ];
}
