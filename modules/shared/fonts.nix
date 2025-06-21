{
  pkgs,
  ...
}:
{
  fonts.packages = with pkgs; [
    # Terminal and coding fonts
    nerd-fonts.mononoki
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
    maple-mono.NF
    noto-fonts-cjk-sans

    # System fonts
    inter
    roboto
    source-serif-pro
    source-sans-pro
    
    # Icon fonts
    font-awesome
    material-design-icons
  ];
}