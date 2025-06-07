{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.cursor = {
    enable = mkEnableOption "Code Cursor configuration";
  };

  config = mkIf config.cursor.enable {
    home.packages = with pkgs; [
      code-cursor
    ];

    home.persistence."/persistent/home/w" = {
      directories = [
        ".cursor"
        ".config/Cursor"
      ];
    };
  };
} 