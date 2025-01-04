{ pkgs, ... } :
let
orchis-themes = pkgs.callPackage ./orchis-themes.nix {};
in
{
  imports = [
    ./dconf.nix
    ./extensions
    ./keybindings.nix
  ];

  home.sessionVariables = {
    GTK_THEME = "Orchis-Red-Dark-Dracula";
  };

  home.packages = with pkgs; [
    bibata-cursors
    dconf-editor
    gnome-network-displays
    (marble-shell-theme.override {
      additionalInstallationTweaks = [ "-Pnp" ];
    })
    (orchis-themes.override {
      border-radius = 8;
      tweaks = [ "black" "macos" "dracula" ];
    })
  ];
}
