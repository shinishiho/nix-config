{
  pkgs,
  ...
}:
{
  imports = [
    ./auto-power-profile.nix
    ./battery-health-charging.nix
    ./blur-my-shell.nix
    ./dash-to-dock.nix
    ./hide-top-bar.nix
    ./night-theme-switcher.nix
    ./pop-shell.nix
    ./user-themes.nix
  ];

  programs.gnome-shell = {
    enable = true;

    extensions = [
      { package = pkgs.gnomeExtensions.gsconnect; }
      { package = pkgs.gnomeExtensions.kimpanel; }
      { package = pkgs.gnomeExtensions.pano; }
    ];
  };
}
