{
  platform ? "linux",
  ...
}:
{
  imports = [
    ./platform.nix
  ];
  
  # Pass platform information to sub-modules
  _module.args = { inherit platform; };
}
