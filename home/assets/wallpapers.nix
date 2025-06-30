{
  lib,
  pkgs,
  ...
}:
let
  wallpapers = {
    dark = ./wallpapers/bg_dark.jpg;
    light = ./wallpapers/bg_light.jpg;
  };
in
{
  # Make wallpapers available to other modules
  _module.args.wallpapers = wallpapers;

  # Install wallpapers to user's local share directory
  home.file = {
    ".local/share/wallpapers/bg_dark.jpg".source = wallpapers.dark;
    ".local/share/wallpapers/bg_light.jpg".source = wallpapers.light;
  };

  # Define wallpaper paths as environment variables for scripts
  home.sessionVariables = {
    WALLPAPER_DARK = "$HOME/.local/share/wallpapers/bg_dark.jpg";
    WALLPAPER_LIGHT = "$HOME/.local/share/wallpapers/bg_light.jpg";
  };
}
