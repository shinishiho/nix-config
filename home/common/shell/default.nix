{
  imports = [
    ./aliases.nix
    ./starship.nix
    ./zsh.nix
    ./fish
  ];

  home.shell = {
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
}
