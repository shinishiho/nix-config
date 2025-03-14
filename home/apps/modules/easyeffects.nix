{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.easyeffects = {
    enable = mkEnableOption "EasyEffects configuration";
  };

  config = mkIf config.easyeffects.enable {
    services.easyeffects = {
      enable = true;
    };
  };
} 