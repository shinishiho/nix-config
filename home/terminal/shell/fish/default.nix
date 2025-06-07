{
  imports = [
    ./aliases.nix
    ./plugins.nix
    ./functions/duf.nix
    ./functions/ffcd.nix
    ./functions/ffe.nix
    ./functions/ffec.nix
    ./functions/fan.nix
  ];

  programs.fish = {
    enable = true;
  };
}
