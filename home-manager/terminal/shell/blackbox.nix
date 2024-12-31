{ pkgs, ... }:
let
tilixThemes = pkgs.fetchFromGitHub {
  owner = "catppuccin";
  repo = "tilix";
  rev = "main";
  sha256 = "sha256-X8Ks33ELcedyvCA1espbyw4X1gxER6BB8PNxjE6mgk0=";
};
in
{
  home.packages = [
    pkgs.blackbox-terminal
  ];

  dconf.settings = {
    "com/raggesilver/BlackBox".font = "CaskaydiaCove Nerd Font Mono 12";
    "com/raggesilver/BlackBox".theme-dark = "Catppuccin Mocha";
    "com/raggesilver/BlackBox".theme-light = "Catppuccin Latte";
  };

  home.file = {
    mocha-theme = {
        source = "${tilixThemes}/themes/catppuccin-mocha.json";
        target = ".local/share/blackbox/schemes/catppuccin-mocha.json";
    };

    latte-theme = {
        source = "${tilixThemes}/themes/catppuccin-latte.json";
        target = ".local/share/blackbox/schemes/catppuccin-latte.json";
    };
  };
}
