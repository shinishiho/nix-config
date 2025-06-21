{ config, lib, pkgs, platform ? "linux", ... }:

let
  inherit (lib) mkEnableOption mkIf optionalAttrs;
in
{
  options.cursor = {
    enable = mkEnableOption "Code Cursor configuration";
  };

  config = mkIf config.cursor.enable ({
    home.packages = with pkgs; [
      code-cursor
    ];
  } // optionalAttrs (platform == "linux") {
    home.persistence."/persistent/home/w" = {
      directories = [
        ".cursor"
        ".config/Cursor"
      ];
    };
  });
} 