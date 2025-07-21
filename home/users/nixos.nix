{
  lib,
  inputs,
  platform ? "linux",
  ...
}:
{
  imports = [
    inputs.nixvim.homeManagerModules.default
    inputs.nix-index-database.hmModules.nix-index
    inputs.agenix.homeManagerModules.default

    ../utilities/archives.nix
    ../utilities/development.nix
    ../utilities/git.nix
    ../utilities/network.nix
    ../utilities/nix-tools.nix
    ../utilities/plover.nix
    # ./rclone.nix
    ../utilities/security.nix
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
    editors = {
      zeditor.enable = false;
      cursor.enable = false;
      vscode.enable = true;
      nvim.enable = true;
    };

    browsers = {
      chromium.enable = false;
      firefox.enable = false;
      zen.enable = true;
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

    communication = {
      thunderbird.enable = false;
    };
  };

  programs.home-manager.enable = true;

  home = {
    username = "w";
    homeDirectory = "/home/w";
    stateVersion = lib.mkForce "25.11";
  };
}
