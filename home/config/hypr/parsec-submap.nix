{
  pkgs,
  ...
}:

{
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
