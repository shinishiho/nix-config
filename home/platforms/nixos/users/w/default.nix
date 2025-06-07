{
  inputs,
  ...
}:
{
  imports = [
    inputs.nixvim.homeManagerModules.default
    inputs.impermanence.homeManagerModules.impermanence
    inputs.nix-index-database.hmModules.nix-index
    inputs.agenix.homeManagerModules.default

    ../../../../apps
    ../../../../terminal/shell
    ../../../../terminal/tools
    ../../../../terminal/misc
    ../../../../terminal/scripts

    ../../desktop/gnome
    ../../desktop/labwc
    ../../desktop/hyprland
    # ../../desktop/hyde

    ../../dev/editor
    ../../dev/toolchain
    ../../dev/shells

    ../../productivity/rclone.nix

    ./impermanence.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "w";
    homeDirectory = "/home/w";
    stateVersion = "25.11";
  };
}
