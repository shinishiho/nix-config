{ pkgs, ... } : {
  imports = [
    ./battery-health-charging.nix
    ./blur-my-shell.nix
    ./dash-to-dock.nix
    ./hide-top-bar.nix
    ./pop-shell.nix
    ./user-themes.nix
  ];

  programs.gnome-shell = {
    enable = true;

    extensions = [
      { package = pkgs.gnomeExtensions.kimpanel; }
      { package = pkgs.gnomeExtensions.pano; }
    ];
  };

  systemd.user.services.tutel = {
      Unit = {
          Description = "Tutel Service";
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
