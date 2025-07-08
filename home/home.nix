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
  ];

  xdg = {
    enable = true;
  } // lib.optionalAttrs (platform == "linux") {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
