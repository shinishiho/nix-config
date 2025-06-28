{
  inputs,
  ...
}:
{
  imports = [
    inputs.disko.nixosModules.default
    inputs.impermanence.nixosModules.impermanence

    ../../../modules/nixos-modules.nix  # Import NixOS-specific modules

    ./hardware-configuration.nix
    ./disko.nix
    ./filesystems.nix
    ./misc.nix
    ./networking.nix
    ./user.nix
  ];

  # Enable the modules that were previously imported directly
  my-modules = {
    shared.fonts.enable = true;
    
    nixos = {
      desktop.gnome.enable = true;
      hardware = {
        enable = true;
        audio.enable = true;
      };
      services = {
        enable = true;
        networking.enable = true;
        ssh.enable = true;
      };
      system = {
        enable = true;
        boot.enable = true;
        locale.enable = true;
        nix.enable = true;
        programs.enable = true;
        security.enable = true;
      };
    };
  };

  system.stateVersion = "25.11";
}
