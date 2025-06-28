{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.my-modules.nixos.services;
in
{
  imports = [
    ./networking.nix
    ./ssh.nix
  ];

  config = mkMerge [
    (mkIf cfg.enable {
      # Services configuration will be loaded from imported modules
    })
    (mkIf cfg.networking.enable {
      # Networking configuration will be loaded from networking.nix
    })
    (mkIf cfg.ssh.enable {
      # SSH configuration will be loaded from ssh.nix
    })
  ];
}
