{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:

with lib;

let
  cfg = config.my-apps.media.obs;
in
{
  options.my-apps.media.obs = {
    enable = mkEnableOption "OBS Studio";
  };

  config = mkIf cfg.enable ({
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };
  } // lib.optionalAttrs (platform == "linux") {
    home.persistence = {
      "/persistent/home/w" = {
        directories = [
          ".config/obs-studio"
        ];
      };
    };
  });
}