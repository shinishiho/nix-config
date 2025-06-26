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
      code-cursor
    ];
  } // lib.optionalAttrs (platform == "linux") {
    home.persistence."/persistent/home/w" = {
      directories = [
        ".cursor"
        ".config/Cursor"
      ];
    };
  });
} 