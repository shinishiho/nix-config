{
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.nixvim.homeModules.default
    inputs.nix-index-database.homeModules.nix-index
    inputs.agenix.homeManagerModules.default

    ../../../../../home/common

    ../../../../../home/platform/x86_64-linux/apps/media
    ../../../../../home/platform/x86_64-linux/desktop/hyprland
    ../../../../../home/platform/x86_64-linux/impermanence.nix
    ../../../../../home/platform/x86_64-linux/terminal/scripts
    ../../../../../home/platform/x86_64-linux/utilities

    ./impermanence.nix
  ];

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
  };
}
