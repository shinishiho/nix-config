{ inputs, ... }:
{
  imports = [
    inputs.nix-index-database.homeModules.nix-index

    ./programs.nix

    ./config/Code
    ./config/fastfetch
    ./config/fish
    ./config/nvim
    ./config/plover
    ./config/wallpaper
    ./config/yazi
    ./config/zed-editor
    ./config/zen

    ./config/gemini-cli.nix
    ./config/gh-dash.nix
    ./config/gh.nix
    ./config/git.nix
    ./config/kitty.nix
    ./config/marimo.nix
    ./config/mpv.nix
    ./config/opencode.nix
    ./config/shellAliases.nix
    ./config/ssh.nix
    ./config/starship.nix
    ./config/zellij.nix
  ];
}
