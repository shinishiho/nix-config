{ inputs, ... }:
{
  imports = [
    ./common.nix

    ./config/agenix
    ./config/DankMaterialShell
    # ./config/hypr
    ./config/niri
    # ./config/rofi

    ./config/cava.nix
    ./config/dsearch.nix
    ./config/matugen.nix
    # ./config/hyprpanel.nix
    ./config/gtk.nix
    # ./config/wallust.nix
  ];
}
