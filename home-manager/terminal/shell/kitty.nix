{
  programs.kitty = {
    enable = true;
    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 12;
    };
    themeFile = "Catppuccin-Mocha";
    shellIntegration.enableZshIntegration = true;
    settings = {
      window_padding_width = 5;
      background = "#000000";
    };
  };
}
