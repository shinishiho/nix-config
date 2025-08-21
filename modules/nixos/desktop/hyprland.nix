{
config,
lib,
inputs,
pkgs,
...
}:

with lib;

let
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  cfg = config.myModules.desktop.hyprland;
in
  {
  options.myModules.desktop.hyprland = {
    enable = mkEnableOption "Hyprland desktop environment";
  };

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      withUWSM = true;
    };

    hardware.graphics = {
      enable = true;
      package = pkgs-unstable.mesa;

      enable32Bit = true;
      package32 = pkgs-unstable.pkgsi686Linux.mesa;
    };

    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
    ];
  };
}
