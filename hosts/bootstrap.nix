{
  pkgs,
  ...
}:

{
  imports = [
    ../modules/common/nix.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "w";
    homeDirectory = "/home/w";
    stateVersion = "26.05";
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    wget
    curl
    zellij
  ];
}
