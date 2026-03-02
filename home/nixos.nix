{ inputs, ... }:
{
  imports = [
    ./common.nix

    ./config/agenix
    ./config/DankMaterialShell
    ./config/niri
    # ./config/rofi
    ./config/zen

    ./config/cava.nix
    ./config/dsearch.nix
    # ./config/hypr
    # ./config/hyprpanel.nix
    # ./config/wallust.nix
  ];
}
