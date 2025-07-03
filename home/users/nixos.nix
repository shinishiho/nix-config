{
  lib,
  inputs,
  platform ? "linux",
  ...
}:
{
  imports = [
    inputs.nixvim.homeManagerModules.default
    inputs.impermanence.homeManagerModules.impermanence
    inputs.nix-index-database.hmModules.nix-index
    inputs.agenix.homeManagerModules.default
    inputs.zen-browser.homeModules.twilight

    # Shared configurations
    ../home.nix
    
    # Applications
    ../apps
    
    # Desktop environments
    # ../desktop/gnome
    ../desktop/labwc
    ../desktop/hyprland
    # ../desktop/hyde

    # NixOS-specific
    ./impermanence.nix
  ];

  # Pass platform to all imported modules
  _module.args = { inherit platform; };

  # Configure applications using the new modular system
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
      parsec.enable = true;
      maa.enable = false;
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
