# Gaming applications
{ platform ? "linux", ... }:

{
  imports = [
    ./parsec.nix
  ];
  
  _module.args = { inherit platform; };
}
