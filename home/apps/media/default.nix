{ config, lib, pkgs, platform ? "linux", ... }:

with lib;

let
  cfg = config.my-apps.media;
in
{
  imports = [
    ./mpv.nix
    ./obs.nix
  ];
  
  # Pass platform to all imported modules
  _module.args = { inherit platform; };
}
