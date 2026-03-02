{ inputs, ... }:
{
  imports = [
    inputs.nix-index-database.homeModules.nix-index

    ./programs.nix

    ./config/Code
    ./config/fastfetch
    ./config/fish
    ./config/maa
    ./config/nvim
    ./config/plover
    ./config/wallpaper
    ./config/yazi

    ./config/gh-dash.nix
    ./config/gh.nix
    ./config/git.nix
    ./config/kitty.nix
    ./config/marimo.nix
    ./config/mpv.nix
    ./config/opencode.nix
    ./config/orca-slicer.nix
    ./config/shellAliases.nix
    ./config/starship.nix
    ./config/viu.nix
    ./config/zellij.nix
  ];
}
