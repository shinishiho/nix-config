
{
  pkgs,
  ...
}:

{
  home.packages = [
    pkgs.gopeed
  ];

  home.persistence."/persistent".directories = [
    ".local/share/com.gopeed.gopeed"
  ];
}
