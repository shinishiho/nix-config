{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # Network utilities
    curl
    wget
    
    # Send files over network
    localsend
  ];
}
