{ config, lib, pkgs, platform ? "linux", ... }:

with lib;

let
  cfg = config.my-apps.communication;
in
{
  imports = [
    ./thunderbird.nix
  ];
  
  # Pass platform to all imported modules
  _module.args = { inherit platform; };
}
