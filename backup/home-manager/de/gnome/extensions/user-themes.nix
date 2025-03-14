{ pkgs, ... }:
{
  programs.gnome-shell.extensions = [ { package = pkgs.gnomeExtensions.user-themes; } ];
}
