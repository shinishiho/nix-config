{
  programs.zed-editor = {
    enable = true;

    extensions = [ "nix" "toml" "html" "make" "latex" "catppuccin-icons" ];

    mutableUserDebug = true;
    mutableUserKeymaps = true;
    mutableUserSettings = true;
    mutableUserTasks = true;

    # userDebug = import ./debug.nix;
    # userKeymaps = import ./keymap.nix;
    userSettings = import ./settings.nix;
    # userTasks = import ./tasks.nix;
  };

  home.persistence."/persistent" = {
    directories = [
      ".config/zed"
      ".local/share/zed/extensions"
      ".local/share/zed/db"
      ".local/share/zed/conversations"
    ];
  };
}
