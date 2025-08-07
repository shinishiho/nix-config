{
  lib,
  inputs,
  pkgs,
  platform ? "linux",
  ...
}:
{
  imports = [
    inputs.nixvim.homeModules.default
    inputs.nix-index-database.homeModules.nix-index
    inputs.agenix.homeManagerModules.default

    ../utilities/archives.nix
    ../utilities/development.nix
    ../utilities/git.nix
    ../utilities/network.nix
    ../utilities/nix-tools.nix
    ../utilities/plover.nix
    # ./rclone.nix
    ../utilities/security.nix
    ../utilities/syncthing-nixos.nix
    # ./xdg.nix

    ../home.nix
    
    ../apps
    
    # ../desktop/gnome
    ../desktop/labwc
    ../desktop/hyprland
    # ../desktop/hyde

    ./impermanence.nix
  ];

  _module.args = { inherit platform; };

  my-apps = {
    browsers = {
      chromium.enable = false;
      firefox.enable = false;
      zen.enable = true;
    };

    communication = {
      thunderbird.enable = false;
    };

    editors = {
      zeditor.enable = false;
      cursor.enable = false;
      vscode.enable = true;
      nvim.enable = true;
    };

    media = {
      mpv.enable = true;
      obs.enable = false;
    };

    gaming = {
      maa.enable = false;
      osu.enable = false;
      streaming.enable = true;
    };
  };

  programs.home-manager.enable = true;

  home = {
    username = "w";
    homeDirectory = "/home/w";
    stateVersion = lib.mkForce "25.11";
    packages = with pkgs; [
      arduino-ide
    ];
  };
}
