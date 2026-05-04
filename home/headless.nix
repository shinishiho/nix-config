{
  imports = [
    ./config/agenix
    ./config/fastfetch
    ./config/fish
    ./config/nvim
    ./config/yazi

    ./config/cava.nix
    ./config/gemini-cli.nix
    ./config/git.nix
    ./config/shellAliases.nix
    ./config/starship.nix
    ./config/tealdeer.nix
    ./config/zellij.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "w";
    homeDirectory = "/home/w";
    stateVersion = "26.05";
  };
}
