{pkgs, ...}: {
  imports = [
    ./gnome-shell.nix
    ./dconf.nix
  ];
  #home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";
}
