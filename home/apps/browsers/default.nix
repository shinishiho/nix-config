{ config, lib, pkgs, platform ? "linux", ... }:

with lib;

let
  cfg = config.my-apps.browsers;
in
{
  imports = [
    ./chromium.nix
    ./firefox.nix
  ];
  
  # Pass platform to all imported modules
  _module.args = { inherit platform; };
}
