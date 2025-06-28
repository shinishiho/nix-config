{
  platform ? "linux",
  ...
}:

{
  imports = [
    ./mpv.nix
    ./obs.nix
  ];
  
  # Pass platform to all imported modules
  _module.args = { inherit platform; };
}
