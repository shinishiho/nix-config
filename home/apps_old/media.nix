# Media applications
{ pkgs, ... }:

{
  # Media player configuration
  mpv.enable = true;
  
  # Audio processing
  services.easyeffects = {
    enable = true;
  };
  
  # Recording and streaming
  obs.enable = false;
  
  # Media packages
  home.packages = with pkgs; [
    # Image viewers/editors
    # gimp
    # inkscape
    
    # Video tools
    # vlc
    # handbrake
    
    # Audio tools
    # audacity
    # tenacity
  ];
}
