{ config, lib, pkgs, platform ? "linux", ... }:

with lib;

let
  cfg = config.my-apps.gaming;
in
{
  imports = [
    ./maa.nix
    ./parsec.nix
  ];
  
  # Pass platform to all imported modules
  _module.args = { inherit platform; };
}
