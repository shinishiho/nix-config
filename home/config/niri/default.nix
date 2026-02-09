{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.niri.homeModules.niri
    ./input.nix
    ./outputs.nix
    ./keybindings.nix
    ./layout.nix
    ./animations.nix
    ./rules.nix
    ./environment.nix
    ./startup.nix
  ];

  programs.niri = {
    enable = true;
  };
}
