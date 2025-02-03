{ pkgs, ... } : {
  imports = [
    ./gnome
  ];

  home.packages = with pkgs; [
    wl-clipboard
  ];
}
