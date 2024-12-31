{pkgs, ...}: {
  imports = [
    ./dconf.nix
    ./gnome-shell.nix
    ./keybindings.nix
  ];
  #home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";
}
