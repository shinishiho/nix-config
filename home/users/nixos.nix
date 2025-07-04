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
