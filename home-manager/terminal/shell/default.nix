{
  imports = [
    # ./blackbox.nix
    # ./kitty.nix
    ./ghostty.nix
    ./starship.nix
    # ./tmux.nix
    ./zsh.nix
  ];

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };
}
