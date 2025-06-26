{ config, lib, pkgs, platform ? "linux", ... }:

with lib;

let
  cfg = config.my-apps.editors;
in
{
  imports = [
    ./nvim
    ./zeditor

    ./cursor.nix
    ./vscode.nix
  ];
  
  # Pass platform to all imported modules
  _module.args = { inherit platform; };
}
