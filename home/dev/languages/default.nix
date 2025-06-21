# Programming language environments
{ pkgs, ... }:

{
  imports = [
    ./python.nix
    ./javascript.nix
    ./rust.nix
    ./nix.nix
  ];
}
