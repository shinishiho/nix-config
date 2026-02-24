{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms-plugin-registry.modules.default
    # inputs.dms.homeModules.niri

    ./plugins
  ];

  programs.dank-material-shell = {
    enable = true;
    quickshell.package = (
      config.lib.nixGL.wrap inputs.dms.packages.
      ${pkgs.stdenv.hostPlatform.system}.quickshell
    );

    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = false;
    enableClipboardPaste = true;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };
 
    # systemd.user.services.niri-flake-polkit.enable = false;

    settings = import ./settings.nix;
    session = import ./session.nix;
    clipboardSettings = import ./clsettings.nix;
  };
}
