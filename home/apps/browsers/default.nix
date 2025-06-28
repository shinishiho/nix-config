{
  platform ? "linux",
  ...
}:

{
  imports = [
    ./chromium.nix
    ./firefox.nix
  ];
  
  # Pass platform to all imported modules
  _module.args = { inherit platform; };
}
