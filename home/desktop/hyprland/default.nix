{
  pkgs,
  ...
}:
{
  imports = [
    ./hypr
    ./mako.nix
    ./rofi.nix
  ];

  # home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 25;
  };

  home.packages = with pkgs; [
    grim
    slurp
    swaybg
    swappy
    xdg-desktop-portal-gtk
    wl-clipboard
    wlsunset
  ];
}
