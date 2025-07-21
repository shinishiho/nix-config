{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.desktop.gaming;
in
{
  options.myModules.desktop.gaming = {
    enable = mkEnableOption "Linux gaming configuration";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      mangohud # Performance monitoring overlay for games
      lutris # Game manager for Linux
    ];

    environment.persistence."/persistent".users.w.directories = [
      ".local/share/Steam"
      ".steam"
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
