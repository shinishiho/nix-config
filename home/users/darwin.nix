{
  inputs,
  platform ? "darwin",
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
    # ./plover.nix
    # ./rclone.nix
    ../utilities/security.nix
    # ./xdg.nix
    
    ../home.nix

    ../apps
  ];

  _module.args = { inherit platform; };

  programs.home-manager.enable = true;

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
    };

    media = {
      mpv.enable = false;
      obs.enable = false;
    };

    gaming = {
      parsec.enable = false;
      maa.enable = true;
    };

    communication = {
      thunderbird.enable = false;
    };
  };

  home = {
    username = "w";
    homeDirectory = "/Users/w";
    stateVersion = "25.11";
  };
}
