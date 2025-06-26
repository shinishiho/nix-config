# Media applications
{ platform ? "linux", ... }:

{
  imports = [
    ./mpv.nix
    ./obs.nix
  ];
  
  _module.args = { inherit platform; };
}
