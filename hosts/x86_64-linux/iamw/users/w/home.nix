{
  inputs,
  ...
}:
{
  imports = with inputs; [
    nixvim.homeModules.default
    nix-index-database.homeModules.nix-index
    agenix.homeManagerModules.default
    impermanence.homeManagerModules.impermanence

    # ../../../../../home/common

    # ../../../../../home/x86_64-linux/desktop/hyprland
    # ../../../../../home/x86_64-linux/impermanence.nix
    # ../../../../../home/x86_64-linux/terminal/scripts
    # ../../../../../home/x86_64-linux/utilities

    ../../../../../home/.config/Code
    ../../../../../home/.config/fastfetch
    ../../../../../home/.config/fish
    ../../../../../home/.config/hypr
    ../../../../../home/.config/nvim
    ../../../../../home/.config/plover
    ../../../../../home/.config/rofi
    ../../../../../home/.config/wallpaper
    ../../../../../home/.config/yazi

    ../../../../../home/.config/cava.nix
    ../../../../../home/.config/gh-dash.nix
    ../../../../../home/.config/gh.nix
    ../../../../../home/.config/git.nix
    ../../../../../home/.config/hyprpanel.nix
    ../../../../../home/.config/kitty.nix
    ../../../../../home/.config/mpv.nix
    ../../../../../home/.config/shellAliases.nix
    ../../../../../home/.config/starship.nix
    ../../../../../home/.config/tmux.nix
    ../../../../../home/.config/wallust.nix
    ../../../../../home/.config/zellij.nix
    ../../../../../home/.config/zsh.nix

    ../../../../../home/.local/state/syncthing.nix

    ../../../../../home/programs.nix
    ../../../../../home/winboat.nix
    ../../../../../home/zen.nix
                                
    ./ssh.nix
    ./impermanence.nix
  ];

  # my-apps = {
  #   browsers = {
  #     chromium.enable = false;
  #     firefox.enable = false;
  #     zen.enable = true;
  #   };
  #
  #   communication = {
  #     thunderbird.enable = false;
  #   };
  #
  #   editors = {
  #     zeditor.enable = false;
  #     cursor.enable = false;
  #     vscode.enable = true;
  #     nvim.enable = true;
  #   };
  #
  #   media = {
  #     mpv.enable = true;
  #     obs.enable = false;
  #   };
  #
  #   gaming = {
  #     maa.enable = false;
  #     osu.enable = false;
  #     streaming.enable = true;
  #   };
  # };

  programs.home-manager.enable = true;

  home = {
    username = "w";
    homeDirectory = "/home/w";
    stateVersion = "25.11";
  };
}
