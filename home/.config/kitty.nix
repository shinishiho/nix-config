_:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "CaskaydiaCove Nerd Font Mono";
      size = 12;
    };

    shellIntegration.enableZshIntegration = true;
    shellIntegration.enableFishIntegration = true;

    settings = {
      background = "#000000";
      background_opacity = 0.9;
      enable_audio_bell = false;
      hide_window_decorations = true;
      include = "colors.conf";
      macos_option_as_alt = true;
      wayland_titlebar_color = "background";
      window_padding_width = 5;
    };

    keybindings = {
      "ctrl+tab" = "send_text normal,application \\x1b[9;5u";
      "ctrl+shift+tab" = "send_text normal,application \\x1b[9;6u";
    };
  };
}
