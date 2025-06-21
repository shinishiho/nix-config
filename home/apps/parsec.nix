{ config, lib, pkgs, platform ? "linux", ... }:

{
  options.parsec = {
    enable = lib.mkEnableOption "Parsec";
  };

  config = lib.mkIf config.parsec.enable ({
    home.packages = with pkgs; [
      parsec-bin
    ];
  } // lib.optionalAttrs (platform == "linux") {
    home.persistence = {
      "/persistent/home/w" = {
        directories = [
          ".parsec"
        ];
      };
    };
  });
} 