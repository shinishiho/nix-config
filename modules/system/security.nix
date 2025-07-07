{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.system.security;
in
{
  options.myModules.system.security = {
    enable = mkEnableOption "Security configuration";
  };

  config = mkIf cfg.enable {
    security.sudo = {
      execWheelOnly = true;
      wheelNeedsPassword = false;
      extraConfig = "Defaults pwfeedback";
    };

    # For polkit authentication
    security.polkit.enable = true;
    security.rtkit.enable = true;
    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
