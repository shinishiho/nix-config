{ inputs, ... }:
{
  imports = [
    inputs.nix-index-database.homeModules.nix-index

    ./programs.nix

    # ./config/Code           # VSCode is gay
    ./config/fastfetch
    ./config/fish
    ./config/nvim
    # ./config/plover         # Has issues with inputs
    ./config/wallpaper
    ./config/yazi
    ./config/zed-editor
    ./config/zen

    ./config/gemini-cli.nix
    # ./config/gh-dash.nix    # What
    # ./config/gh.nix         # are these two?
    ./config/git.nix
    ./config/kitty.nix
    # ./config/marimo.nix     # I'm done, bye
    ./config/mpv.nix
    ./config/opencode.nix
    ./config/shellAliases.nix
    ./config/ssh.nix
    ./config/starship.nix
    ./config/tealdeer.nix
    ./config/zellij.nix
  ];
}
