{
  config,
  inputs,
  pkgs,
  ...
}:

{
  home.packages = [
    inputs.winboat.winboat
    pkgs.freerdp
  ];

  home.persistence."/persistent/home/${config.home.username}".directories = [
    "winship"
    ".winboat"
  ];
}
