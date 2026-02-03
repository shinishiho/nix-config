{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

with lib;

let
  cfg = config.myModules.services.gaming;
in

  {
  options.myModules.services.gaming = {
    enable = mkEnableOption "Enable Steam and some gaming companions";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      mangohud
      lutris
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

      extraCompatPackages = [
        inputs.dw-proton.packages."x86_64-linux".default
        pkgs.proton-ge-bin
      ];
    };

    environment.persistence."/persistent".users.w.directories = [
      ".local/share/Steam"
      ".local/share/lutris"
      ".steam"
    ];
  };
}
