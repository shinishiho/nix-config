{
  imports = [
    ./common.nix

    ./config/agenix
    ./config/DankMaterialShell
    # ./config/hypr
    ./config/maa
    ./config/niri
    # ./config/rofi

    ./config/cava.nix
    ./config/dsearch.nix
    ./config/gtk.nix
    # ./config/hyprpanel.nix
    ./config/matugen.nix
    ./config/orca-slicer.nix
    ./config/viu.nix
    # ./config/wallust.nix
  ];

  home.persistence."/persistent" = {
    directories = [
      "nix-config"
      "W"
    ];

    files = [
    ];
  };
}
