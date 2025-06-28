{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.my-modules.nixos.hardware.audio;
in
{
  config = mkIf cfg.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };

    environment.systemPackages = [
      pkgs.portaudio
    ];
  };
}
