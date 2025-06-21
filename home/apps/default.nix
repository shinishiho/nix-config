# Application modules with platform awareness
{ platform ? "linux", ... }:

{
  imports = [
    ./zed

    ./chromium.nix
    ./firefox.nix
    ./mpv.nix
    ./obs.nix
    ./parsec.nix
    ./thunderbird.nix
  ];
  
  _module.args = { inherit platform; };
} 