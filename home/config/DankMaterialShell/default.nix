{
  inputs,
  pkgs,
  config,
  ...
}:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms-plugin-registry.homeModules.default
    inputs.dms.homeModules.niri

    ./plugins
  ];

  programs.dank-material-shell = {
    enable = true;
    package = (inputs.dms.lib.mkDmsShell pkgs).override {
      extraQtPackages = [ pkgs.kdePackages.qtwebsockets ]; # Home Assistant plugin
    };
    quickshell.package = config.lib.nixGL.wrap pkgs.quickshell;

    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = false;

    niri = {
      enableKeybinds = false;
      enableSpawn = true;
    };

    settings = import ./settings.nix;
  };

  home.persistence."/persistent".directories = [
    ".local/state/dms"
  ];
}
