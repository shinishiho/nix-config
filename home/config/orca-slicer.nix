{
  config,
  pkgs,
  ...
}:

{
  home.packages = [
    pkgs.orca-slicer
  ];

  home.persistence."/persistent/home/${config.home.username}".directories = [
    ".config/OrcaSlicer"
  ];
}
