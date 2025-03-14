{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.obs = {
    enable = mkEnableOption "OBS Studio configuration";
  };

  config = mkIf config.obs.enable {
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };
  };
} 