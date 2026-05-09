{
  imports = [
    ../cli.nix
    ../gui.nix

    ../config/agenix
    ../config/DankMaterialShell
    # ../config/hypr
    ../config/maa
    ../config/niri
    # ./config/rofi

    ../config/dsearch.nix
    ../config/gtk.nix
    # ../config/hyprpanel.nix
    ../config/matugen.nix
    ../config/orca-slicer.nix
    # ../config/wallust.nix

    ../local/state/syncthing.nix
  ];

  programs.home-manager.enable = true;

  home.persistence."/persistent" = {
    directories = [
      "nix-config"
      "W"
    ];

    files = [
    ];
  };

  home = {
    username = "w";
    homeDirectory = "/home/w";
    stateVersion = "26.05";
  };
}
