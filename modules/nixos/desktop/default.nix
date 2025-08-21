{
  imports = [
    ./displayManager.nix
    ./gaming.nix
    ./gnome.nix
    ./hyprland.nix
  ];

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
    pathsToLink = [
      "/share/xdg-desktop-portal"
      "/share/applications"
    ];
  };
}
