# Productivity applications
{ pkgs, ... }:

{
  # Email client
  thunderbird.enable = false;
  
  # Productivity packages
  home.packages = with pkgs; [
    # Password management
    proton-pass
    
    # Communication
    signal-desktop
    # discord
    # slack
    
    # Note taking
    # obsidian
    # notion-app-enhanced
    
    # Office suite (LibreOffice alternatives)
    # libreoffice-fresh
    # onlyoffice-bin
  ];
}
