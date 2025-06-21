# Linux-specific applications
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # System tools
    gparted
    
    # Gaming
    parsec-bin
    
    # Linux-specific tools
    # gnome-tweaks
    # dconf-editor
    # gufw  # GUI firewall
  ];
  
  # Input method for international languages
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = [ pkgs.fcitx5-bamboo ];
  };
}
