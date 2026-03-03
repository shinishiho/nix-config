{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.niri.settings = {
    spawn-at-startup = [
      { argv = [ "${inputs.niri-float-sticky.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/niri-float-sticky" ]; }
      { argv = [ "${pkgs.fcitx5}/bin/fcitx5" ]; }
      # { argv = [ "${pkgs.xwayland-satellite-unstable}/bin/xwayland-satellite" ]; }
      { sh = "${pkgs.showmethekey}/bin/showmethekey-gtk -kAC"; }
    ];
  };
}
