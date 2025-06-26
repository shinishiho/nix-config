# Communication applications
{ platform ? "linux", ... }:

{
  imports = [
    # ./thunderbird.nix
  ];
  
  _module.args = { inherit platform; };
}
