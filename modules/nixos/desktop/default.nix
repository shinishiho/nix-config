_:

{
  imports = [
    ./displayManager.nix
    ./gaming.nix
    ./gnome.nix
    ./hyprland.nix
  ];

  services.udev.extraHwdb = ''
    evdev:atkbd:*
      KEYBOARD_KEY_3a=esc
  '';

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
    pathsToLink = [
      "/share/xdg-desktop-portal"
      "/share/applications"
    ];
  };

  hardware.graphics.enable = true;
}
