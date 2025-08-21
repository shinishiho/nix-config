{
  imports = [
    ./aeroSpace.nix
    ./systemDefaults.nix
  ];

  nix.enable = false;
  nixpkgs.config.allowUnfree = true;
} 
