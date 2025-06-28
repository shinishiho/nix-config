{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # Archive utilities
    zip
    unzip
    p7zip
  ];
}
