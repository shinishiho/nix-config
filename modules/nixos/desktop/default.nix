_:

{
  imports = [
    ./displayManager.nix
    ./gnome.nix
    # ./hydenix.nix
  ];

  services.udev.extraHwdb = ''
    evdev:atkbd:*
      KEYBOARD_KEY_3a=esc
  '';

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
