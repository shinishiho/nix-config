{
  imports = [
    ./cava.nix
    ./fastfetch.nix
  ];

  programs = {
    thefuck.enable = true;
  };
}
