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
        xdg-desktop-portal-wlr
        kdePackages.xdg-desktop-portal-kde
      ];
      configPackages = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
        kdePackages.xdg-desktop-portal-kde
      ];
      # config.common = {
      #   default = ["gnome" "hyprland" "gtk"];
      #   "org.freedesktop.impl.portal.Settings" = "gnome";
      # };
    };
  };
}
