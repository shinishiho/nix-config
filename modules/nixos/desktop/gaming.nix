{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.shared.gaming;
in
{
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      mangohud # Performance monitoring overlay for games
      lutris # Game manager for Linux
    ];

    programs.gamescope = {
      enable = true;
      capSysNice = true;
    };

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}