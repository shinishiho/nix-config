# Browser configurations
{ pkgs, ... }:

{
  # Import browser modules
  chromium = {
    enable = true;
    flavor = pkgs.ungoogled-chromium;
  };
  
  firefox.enable = false;  # Can be enabled per-platform
  
  # Browser packages
  home.packages = with pkgs; [
    # Alternative browsers
    # vivaldi
    # brave
  ];
}
