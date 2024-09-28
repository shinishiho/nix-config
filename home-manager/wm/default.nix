{ pkgs, ... }: {
  imports = [
    ./hyprland.nix
    ./mako.nix
    ./rofi.nix
  ];

  home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";

  home.packages = with pkgs; [
    grim
    safeeyes
    slurp
    swaybg
    swappy
    wl-clipboard
  ];
}
