{ inputs, ... }:

{
  imports = [
    inputs.paneru.homeModules.paneru

    ./options.nix
    ./decorations.nix
    ./bindings.nix
    ./windows.nix
  ];

  services.paneru.enable = true;
}
