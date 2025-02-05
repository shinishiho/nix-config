{ pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    ./mako.nix
    ./rofi.nix
  ];

  home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";

  home.packages = with pkgs; [
    grim
    slurp
    swaybg
    swappy
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    wl-clipboard
    wlsunset
  ];
}
