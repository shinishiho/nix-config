{
  lib,
  platform ? "linux",
  ...
}:
{
  imports = [
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