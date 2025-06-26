# Browser applications
{ platform ? "linux", ... }:

{
  imports = [
    ./chromium.nix
    # ./firefox.nix
  ];
  
  _module.args = { inherit platform; };
}
