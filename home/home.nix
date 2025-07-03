{
  lib,
  platform ? "linux",
  ...
}:
{
  imports = [
    ./assets
    ./shell
    ./terminal
    ./utilities
  ];

  _module.args = { inherit platform; };
}