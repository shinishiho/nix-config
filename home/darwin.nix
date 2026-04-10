{
  lib,
  ...
}:

{
  imports = [
    ./common.nix

    ./config/aerospace
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
