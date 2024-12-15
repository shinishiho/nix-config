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
      enable_audio_bell = false;
      background = "#000000";
    };

    keybindings = {
      "ctrl+tab" = "send_text normal,application \\x1b[9;5u";
      "ctrl+shift+tab" = "send_text normal,application \\x1b[9;6u";
    };
  };
}
