{
  pkgs,
  ...
}:
{
  imports = [
    ./hypr
    ./hyprpanel.nix
    # ./mako.nix
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
    brightnessctl
    grim
    grimblast
    hyprpicker
    hyprsunset
    matugen
    pywal
    slurp
    swappy
    swww
    xdg-desktop-portal-gtk
    wf-recorder
    wl-clipboard
  ];
}
