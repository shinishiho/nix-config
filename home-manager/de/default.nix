{ pkgs, ... } : {
  imports = [
    ./gnome
  ];

  home.packages = [
    pkgs.wl-clipboard
  ];
}
