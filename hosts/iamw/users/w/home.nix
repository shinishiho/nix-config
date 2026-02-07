{
  inputs,
  pkgs,
  ...
}:
{
  imports = with inputs; [
    nix-index-database.homeModules.nix-index
    agenix.homeManagerModules.default

    ../../../../home/config/Code
    ../../../../home/config/fastfetch
    ../../../../home/config/fish
    # ../../../../home/config/hypr
    ../../../../home/config/maa
    # ../../../../home/config/niri
    ../../../../home/config/nvim
    ../../../../home/config/plover
    ../../../../home/config/rofi
    ../../../../home/config/wallpaper
    ../../../../home/config/yazi

    ../../../../home/config/cava.nix
    ../../../../home/config/gh-dash.nix
    ../../../../home/config/gh.nix
    ../../../../home/config/git.nix
    # ../../../../home/config/hyprpanel.nix
    ../../../../home/config/kitty.nix
    ../../../../home/config/marimo.nix
    ../../../../home/config/mpv.nix
    ../../../../home/config/orca-slicer.nix
    ../../../../home/config/shellAliases.nix
    ../../../../home/config/starship.nix
    # ../../../../home/config/tmux.nix
    ../../../../home/config/wallust.nix
    # ../../../../home/config/zellij.nix
    # ../../../../home/config/zsh.nix

    ../../../../home/local/state/syncthing.nix

    ../../../../home/local/share/gopeed.nix

    ../../../../home/programs.nix
    ../../../../home/zen.nix
                                
    ./ssh.nix
    ./impermanence.nix
  ];

  programs.home-manager.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      substituters = [
        "https://cache.nixos.org"
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
        "https://niri.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      ];
      extra-experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  home = {
    username = "w";
    homeDirectory = "/home/w";
    stateVersion = "25.11";
  };
}
