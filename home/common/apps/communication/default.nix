{
  pkgs,
  ...
}:

{
  imports = [
    ./thunderbird.nix
  ];

  home.packages = with pkgs; [
    signal-desktop-bin
  ];
}
