{
  pkgs,
  platform ? "linux",
  ...
}:

{
  imports = [
    ./thunderbird.nix
  ];
  
  # Pass platform to all imported modules
  _module.args = { inherit platform; };

  home.packages = with pkgs; [
    signal-desktop-bin
  ];
}
