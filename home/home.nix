{
  lib,
  platform ? "linux",
  ...
}:
{
  imports = [
    ./assets
    ./shell
    ./terminal
    ./utilities
  ];
  
  xdg = {
    enable = true;
  } // lib.optionalAttrs (platform == "linux") {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  home.sessionVariables = {
    NH_NO_CHECKS = "1";
  };
}