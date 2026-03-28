{
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.agenix.nixosModules.default

    ../../modules/common
    ../../modules/nixos

    ./hardware-configuration.nix

    ./hardware.nix
    ./networking.nix
    ./nvidia.nix

    ./user.nix
  ];

  myModules = {
    desktop = {
      autoLogin = {
        enable = true;
        user = "w";
        command = "niri-session";
      };
      gnome.enable = false;
      hyprland.enable = false;
      niri.enable = true;
    };

    hardware = {
      audio.enable = true;
      bluetooth.enable = true;
    };

    services = {
      docker.enable = false;
      gaming.enable = true;
      keyd.enable = true;
      networking.enable = true;
      ssh.enable = true;
      sunshine.enable = true;
      tailscale.enable = false;
      waydroid.enable = false;
      zerotierone.enable = true;
    };

    system = {
      inputMethod.enable = true;
      secureBoot.enable = true;
    };
  };

  system.stateVersion = lib.mkForce "26.05";
}
