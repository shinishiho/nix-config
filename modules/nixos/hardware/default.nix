{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.my-modules.nixos.hardware;
in
{
  imports = [
    ./audio.nix
  ];

  config = mkMerge [
    (mkIf cfg.enable {
      # Hardware configuration will be loaded from imported modules
    })
    (mkIf cfg.audio.enable {
      # Audio configuration will be loaded from audio.nix
    })
  ];
}
