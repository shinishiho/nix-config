{
  pkgs,
  ...
}:

{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        # xdg-desktop-portal-hyprland # Bundled in Hyprland module
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gnome
      ];
      configPackages = with pkgs; [
        xdg-desktop-portal-gtk
        # xdg-desktop-portal-hyprland
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gnome
      ];
      config.common = {
        default = ["gnome" "hyprland" "gtk"];
        "org.freedesktop.impl.portal.Settings" = "gnome";
      };
    };
  };
}
