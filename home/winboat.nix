{
  config,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    winboat
    freerdp
  ];

  home.persistence."/persistent/home/${config.home.username}".directories = [
    "winship"
    ".winboat"
  ];
}
