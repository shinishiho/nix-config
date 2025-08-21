{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.my-apps.gaming;
in
{
  imports = [
    ./maa
    ./streaming.nix
  ];

  options.my-apps.gaming.osu = {
    enable = mkEnableOption "osu! Lazer";
  };

  config.home = mkIf cfg.osu.enable {
    packages = with pkgs; [
      osu-lazer-bin
    ];
  };
}
