{
  lib,
  platform ? "linux",
  ...
}:
{
  imports = [
    ./shared
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