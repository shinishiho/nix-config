{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.desktop.niri;
in
  {
  options.myModules.desktop.niri = {
    enable = mkEnableOption "Niri desktop environment";
  };

  imports = [
    inputs.niri.nixosModules.niri
  ];

  config = mkIf cfg.enable {
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      xwayland-satellite-unstable
    ];
  };
}
