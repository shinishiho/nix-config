{
  inputs,
  ...
}:

{
  imports = [
    inputs.agenix.homeManagerModules.default
    inputs.nixvim.homeModules.default
    inputs.nix-index-database.homeModules.nix-index

    ../../../../../home/common
    ../../../../../home/platform/aarch64-darwin
  ];

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
      streaming.enable = false;
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
