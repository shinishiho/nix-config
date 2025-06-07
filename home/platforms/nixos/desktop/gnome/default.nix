{ pkgs, ... }:
{
  imports = [
    ./dconf.nix
    ./extensions
    ./keybindings.nix
    ./startups.nix
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
  };

  home.packages = with pkgs; [
    bibata-cursors
    dconf-editor
    gnome-network-displays
    (orchis-theme.override {
      border-radius = 8;
      tweaks = [
        "black"
        "macos"
        "dracula"
      ];
    })
  ];
}
