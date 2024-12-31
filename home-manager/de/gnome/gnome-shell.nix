{pkgs, ...}: {
  programs.gnome-shell = {
    enable = true;

    extensions = [
      { package = pkgs.gnomeExtensions.battery-health-charging; }
      { package = pkgs.gnomeExtensions.blur-my-shell; }
      { package = pkgs.gnomeExtensions.gsconnect; }
      { package = pkgs.gnomeExtensions.kimpanel; }
      { package = pkgs.gnomeExtensions.pop-shell; }
      # { package = pkgs.gnomeExtensions.tiling-assistant; }
    ];
  };
}
