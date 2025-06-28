{
  platform ? "linux",
  ...
}:

{
  imports = [
    ./maa.nix
    ./parsec.nix
  ];
  
  # Pass platform to all imported modules
  _module.args = { inherit platform; };
}
