{
  lib,
  ...
}:

{
  imports = [
    ../cli.nix
    ../gui.nix

    # ../config/aerospace  # temporarily disabled in favor of paneru
    ../config/paneru
  ];

  config = {
    programs.home-manager.enable = true;

    home = {
      username = "w";
      homeDirectory = "/Users/w";
      stateVersion = "26.05";
    };
  };

  options.home.persistence = lib.mkOption {
    type = lib.types.attrsOf (lib.types.anything);
    default = { };
    description = "Impermanence no-op on non-NixOS";
  };
}
