{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.niri.settings = {
    # Startup applications
    spawn-at-startup = [
      { argv = [ "${inputs.niri-float-sticky.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/niri-float-sticky" ]; }
      { sh = "${pkgs.showmethekey}/bin/showmethekey-gtk -kAC"; }
    ];
  };
}
