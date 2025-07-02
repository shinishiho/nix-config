{
  platform ? "linux",
  ...
}:

{
  imports = [
    ./chromium.nix
    ./firefox.nix
    ./zen.nix
  ];
  
  # Pass platform to all imported modules
  _module.args = { inherit platform; };
}
