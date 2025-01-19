{ pkgs, ... } : {
  systemd.user.services.tutel = {
      Unit = {
          Description = "Turtle daemon for Nautilus Git extension";
      };
      Install = {
          WantedBy = [ "graphical-session.target" ];
      };
      Service = {
          ExecStart = "${pkgs.writeShellScript "tutel-service" ''
              #!/run/current-system/sw/bin/bash
              ${pkgs.turtle}/bin/turtle_service
          ''}";
      };
  };
}
