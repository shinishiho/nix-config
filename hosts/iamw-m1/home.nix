{
  inputs,
  ...
}:

{
  imports = [
    ../../home/darwin.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "w";
    homeDirectory = "/Users/w";
    stateVersion = "26.05";
  };
}
