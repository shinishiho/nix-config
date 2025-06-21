# Platform-specific application sets
{ pkgs, lib, platform ? "linux", ... }:

{
  imports = [
    ../modules
  ] ++ lib.optionals (platform == "linux") [
    ./browsers.nix
    ./media.nix
    ./productivity.nix
    ./development.nix
    ./linux-apps.nix
  ] ++ lib.optionals (platform == "darwin") [
    ./darwin-apps.nix
  ];
}
