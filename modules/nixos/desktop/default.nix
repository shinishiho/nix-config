{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.my-modules.nixos.desktop;
in
{
  imports = [
    ./gnome.nix
  ];

  config = mkMerge [
    (mkIf cfg.gnome.enable {
      # GNOME configuration will be loaded from gnome.nix
    })
  ];
}
