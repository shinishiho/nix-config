{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:
{
  config = ({
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