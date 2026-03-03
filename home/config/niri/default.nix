{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    inputs.niri.homeModules.niri
    ./input.nix
    ./outputs.nix
    ./keybindings.nix
    ./layout.nix
    ./animations.nix
    ./rules.nix
    ./environment.nix
    ./startup.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;

    settings.xwayland-satellite = {
      enable = true;
      path = lib.getExe pkgs.xwayland-satellite-unstable;
    };
  };

  home.packages = with pkgs; [
    wl-clipboard
  ];
}
