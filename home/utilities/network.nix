{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # Network utilities
    curl
    wget
  ];
}
