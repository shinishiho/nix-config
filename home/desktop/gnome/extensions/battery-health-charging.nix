{
  pkgs,
  ...
}:
{
  programs.gnome-shell.extensions = [ { package = pkgs.gnomeExtensions.battery-health-charging; } ];

  dconf.settings."org/gnome/shell/extensions/Battery-Health-Charging".charging-mode = "bal";

  systemd.user.services.asus-bat = {
    Unit = {
      Description = "ASUS Battery Health Charging Service";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.writeShellScript "asus-bat" ''
        #!/run/current-system/sw/bin/bash
        if [ ! -f /usr/local/bin/batteryhealthchargingctl-w ]; then
            /run/wrappers/bin/sudo ${pkgs.gnomeExtensions.battery-health-charging}/share/gnome-shell/extensions/Battery-Health-Charging@maniacx.github.com/tool/installer.sh --tool-user w install
        fi
      ''}";
    };
  };
}
