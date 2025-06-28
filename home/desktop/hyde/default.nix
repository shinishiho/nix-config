{
  hydenix.hm = {
    enable = true;
    # comma.enable = true; # useful nix tool to run software without installing it first
    # dolphin.enable = true; # file manager
    editors = {
      enable = true; # enable editors module
      neovim = true; # enable neovim module
      vscode = {
        enable = false; # enable vscode module
        wallbash = false; # enable wallbash extension for vscode
      };
      vim = false; # enable vim module
      default = "nvim"; # default text editor
    };
    fastfetch.enable = true; # fastfetch configuration
    firefox.enable = false; # enable firefox module
    git.enable = false;
    # hyde.enable = true; # enable hyde module
    # hyprland = {
    #   enable = true; # enable hyprland module
    #   extraConfig = ""; # extra hyprland config text
    # };
    # lockscreen = {
    #   enable = true; # enable lockscreen module
    #   hyprlock = true; # enable hyprlock lockscreen
    #   swaylock = false; # enable swaylock lockscreen
    # };
    # notifications.enable = true; # enable notifications module
    # qt.enable = true; # enable qt module
    # rofi.enable = true; # enable rofi module
    # screenshots = {
    #   enable = true; # enable screenshots module
    #   grim.enable = true; # enable grim screenshot tool
    #   slurp.enable = true; # enable slurp region selection tool
    #   satty.enable = false; # enable satty screenshot annotation tool
    #   swappy.enable = true; # enable swappy screenshot editor
    # };
    shell = {
      enable = true; # enable shell module
      zsh.enable = false; # enable zsh shell
      bash.enable = false; # enable bash shell
      fish.enable = true; # enable fish shell
      pokego.enable = false; # enable Pokemon ASCII art scripts
      p10k.enable = false; # enable p10k prompt
      starship.enable = true; # enable starship prompt
    };
    social = {
      enable = false; # enable social module
      discord.enable = false; # enable discord module
      webcord.enable = false; # enable webcord module
      vesktop.enable = false; # enable vesktop module
    };
    # spotify.enable = true; # enable spotify module
    # swww.enable = true; # enable swww wallpaper daemon
    # terminals = {
    #   enable = true; # enable terminals module
    #   kitty = {
    #     enable = true; # enable kitty terminal
    #     configText = ""; # kitty config text
    #   };
    # };
    # theme = {
    #   enable = true; # enable theme module
    #   active = "Catppuccin Mocha"; # active theme name
    #   themes = [
    #     "Catppuccin Mocha"
    #     "Catppuccin Latte"
    #   ]; # default enabled themes, full list in https://github.com/richen604/hydenix/tree/main/hydenix/sources/themes
    # };
    # waybar.enable = true; # enable waybar module
    # wlogout.enable = true; # enable wlogout module
    # xdg.enable = true; # enable xdg module
  };
}
