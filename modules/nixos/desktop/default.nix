{
  imports = [
    ./autoLogin.nix
    ./gnome.nix
    ./hyprland.nix
  ];

  environment = {
    # Wayland, please become stable someday so I can remove this option.
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
