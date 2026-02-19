{
  config,
  pkgs,
  ...
}:

{
  home.packages = [
    (config.lib.nixGL.wrap pkgs.orca-slicer)
  ];

  home.persistence."/persistent".directories = [
    ".config/OrcaSlicer"
  ];
}
