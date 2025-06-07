{ config, lib, pkgs, ... }:

{
  options.parsec = {
    enable = lib.mkEnableOption "Parsec";
  };

  config = lib.mkIf config.parsec.enable {
    home.packages = with pkgs; [
      parsec-bin
    ];

    home.persistence = {
      "/persistent/home/w" = {
        directories = [
          ".parsec"
        ];
      };
    };
  };
} 