{pkgs, ...}: {
  programs.gnome-shell = {
    enable = true;

    extensions = [
      { package = pkgs.gnomeExtensions.tiling-assistant; }
      { package = pkgs.gnomeExtensions.blur-my-shell; }
      { package = pkgs.gnomeExtensions.battery-health-charging; }
      { package = pkgs.gnomeExtensions.gsconnect; }
      { package = pkgs.gnomeExtensions.astra-monitor; }
    ];
  };
}
