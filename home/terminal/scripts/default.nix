{
  lib,
  platform ? "linux",
  ...
}:
{
  imports = lib.optionals (platform == "linux") [
    ./search.nix
    ./wallpaper.nix
  ];
}
