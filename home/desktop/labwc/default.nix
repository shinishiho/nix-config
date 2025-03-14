{ pkgs, ... }:
{
  imports = [
    ./labwc.nix
  ];

  home.packages = with pkgs; [
    labwc
  ];
}
