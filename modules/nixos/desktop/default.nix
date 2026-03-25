{
  pkgs,
  ...
}:

{
  imports = [
    ./autoLogin.nix
    ./gnome.nix
    ./hyprland.nix
    ./niri.nix
  ];

  environment = {
    # Wayland, please become stable someday so I can remove this option.
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    systemPackages = with pkgs; [
      adwaita-icon-theme
      wl-clipboard
    ];
  };
}
