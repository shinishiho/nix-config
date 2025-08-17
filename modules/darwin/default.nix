{
  imports = [
    ./system.nix
    ./wm.nix
    ./goodies.nix
  ];

  nix.enable = false;
  nixpkgs.config.allowUnfree = true;
} 
