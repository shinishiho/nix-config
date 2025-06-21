# Darwin/macOS-specific applications
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # macOS package managers
    mas     # Mac App Store CLI
    m-cli   # macOS management CLI
    
    # macOS-specific tools
    # rectangle      # Window management
    # alfred         # Application launcher
    # cleanmymac     # System maintenance
    
    # File management
    # the-unarchiver
    # finder-replace
  ];
}
