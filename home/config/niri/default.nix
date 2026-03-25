{
  imports = [
    # Bundled in the system niri
    # inputs.niri.homeModules.niri

    ./input.nix
    ./outputs.nix
    ./keybindings.nix
    ./layout.nix
    ./animations.nix
    ./rules.nix
    ./environment.nix
    ./startup.nix
  ];
}
